import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

/// 创建时间：2019/9/27
/// 作者：admin
/// 描述：

class Clock extends CustomPainter {
  int second;
  int minues;
  int hours;

  Paint clockPaint;

  //刻度圆的PATH
  Paint littleCirclePaint;
  Paint circlePaint;

  Clock(int second, int minues, int hours) {
    this.second = second;
    this.minues = minues;
    this.hours = hours;
    clockPaint = Paint();
    circlePaint = Paint();
    littleCirclePaint = Paint();
    littleCirclePaint.isAntiAlias = true;
    littleCirclePaint.style = PaintingStyle.stroke;
    littleCirclePaint.color = Colors.transparent;

    clockPaint.color = Colors.black;
    clockPaint.strokeWidth = 4;
    circlePaint.color = Colors.yellow;
    circlePaint.style = PaintingStyle.fill;

    clockPaint.style = PaintingStyle.fill;
    clockPaint.strokeCap = StrokeCap.round;
    circlePaint.strokeCap = StrokeCap.round;
    circlePaint.strokeJoin = StrokeJoin.round;
    clockPaint.strokeJoin = StrokeJoin.round;
    clockPaint.isAntiAlias = true;
    circlePaint.isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    clockPaint.strokeWidth = 4;
    double radius = size.width / 2.toDouble();
    //画时钟的圆盘
    Path path = Path();
    Path littlePath = Path();
    path.addArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        -pi/2,
        2 * pi);

    //拿到
    canvas.drawPath(path, circlePaint);

    littlePath.addArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: radius - 10),
       -pi/2,
        2 * pi);


    canvas.drawPath(littlePath, littleCirclePaint);

    //path.addpath 所以有多个pahtMetrics，这里 我们只有一个圆，所以只有一个
    PathMetrics metric = path.computeMetrics(forceClosed: false);
    //拿到圆的路劲
    PathMetric circleMetric = metric.toList()[0];

    PathMetrics littermetric = littlePath.computeMetrics(forceClosed: false);
    //拿到圆的路劲
    PathMetric littermetriccircleMetric = littermetric.toList()[0];
    //总长度
    double length = circleMetric.length;
    double litterlength = littermetriccircleMetric.length;

    //画刻度
    for (int i = 0; i < 60; i++) {
      //当前个的路径长度
      double nowlength = (length / 60) * (i);
      double littlelength = (litterlength / 60) * i;
      //拿到当前路径的角度
      Tangent angle = circleMetric.getTangentForOffset(nowlength);
      Tangent litterangle =
          littermetriccircleMetric.getTangentForOffset(littlelength);
      //到时候画线在根据角度来旋转一下就行了
      double nowangle = angle.angle;
      Offset position = angle.position;
      Offset littleposition = litterangle.position;
      canvas.drawLine(position, littleposition, clockPaint);
    }
    //画中心的圆点
    canvas.drawCircle(Offset(radius, radius), 10, clockPaint);

    // 画秒针
    drawLine(4, litterlength, littermetriccircleMetric, radius, 0.95, canvas,
        second, 60);
    //画分针
    drawLine(6, litterlength, littermetriccircleMetric, radius, 0.8, canvas,
        minues, 60);
    //画时针
    drawLine(8, litterlength, littermetriccircleMetric, radius, 0.6, canvas,
       hours, 12);

    print("挡墙的时钟${hours}");
  }

  /**
   * 画线
   */
  void drawLine(
      double width,
      double length,
      PathMetric littermetriccircleMetric,
      double radius,
      double percent,
      Canvas canvas,
      int time,
      double part) {
    clockPaint.strokeWidth = width;
    double minlength = (length / part) * (time+length/part);
    switch (width.toInt()) {
      case 4:
        minlength  =(length / part) * time;
        break;

      case 6:
        minlength  =(length / part) * time+((length/part)/60.00)*(second);
        break;

      case 8:
        minlength  =(length / part) * (time+(minues/60));


        break;

    }
    //拿到当前路径的角度
    Path minP = Path();
    Tangent minangle = littermetriccircleMetric.getTangentForOffset(minlength);
    Offset minPosition = minangle.position;
    minP.moveTo(radius, radius);
    minP.lineTo(minPosition.dx, minPosition.dy);
    PathMetric minMe = minP.computeMetrics().toList()[0];
    double minlengt = minMe.length;
    Offset end = minMe.getTangentForOffset(minlengt * percent).position;
    canvas.drawLine(Offset(radius, radius), end, clockPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
