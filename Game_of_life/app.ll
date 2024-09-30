; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @copyField(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %34, %2
  %8 = load i32, ptr %5, align 4
  %9 = icmp slt i32 %8, 64
  br i1 %9, label %10, label %37

10:                                               ; preds = %7
  store i32 0, ptr %6, align 4
  br label %11

11:                                               ; preds = %30, %10
  %12 = load i32, ptr %6, align 4
  %13 = icmp slt i32 %12, 32
  br i1 %13, label %14, label %33

14:                                               ; preds = %11
  %15 = load ptr, ptr %3, align 8
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [32 x i8], ptr %15, i64 %17
  %19 = load i32, ptr %6, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [32 x i8], ptr %18, i64 0, i64 %20
  %22 = load i8, ptr %21, align 1
  %23 = load ptr, ptr %4, align 8
  %24 = load i32, ptr %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [32 x i8], ptr %23, i64 %25
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [32 x i8], ptr %26, i64 0, i64 %28
  store i8 %22, ptr %29, align 1
  br label %30

30:                                               ; preds = %14
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %6, align 4
  br label %11, !llvm.loop !6

33:                                               ; preds = %11
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %5, align 4
  br label %7, !llvm.loop !8

37:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @app() #0 {
  %1 = alloca [64 x [32 x i8]], align 16
  call void @llvm.memset.p0.i64(ptr align 16 %1, i8 0, i64 2048, i1 false)
  %2 = getelementptr inbounds [64 x [32 x i8]], ptr %1, i64 0, i64 0
  call void @enterStartConfiguration(ptr noundef %2)
  br label %3

3:                                                ; preds = %3, %0
  %4 = getelementptr inbounds [64 x [32 x i8]], ptr %1, i64 0, i64 0
  call void @uploadField(ptr noundef %4)
  %5 = getelementptr inbounds [64 x [32 x i8]], ptr %1, i64 0, i64 0
  call void @processField(ptr noundef %5)
  br label %3
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @enterStartConfiguration(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds [32 x i8], ptr %3, i64 0
  %5 = getelementptr inbounds [32 x i8], ptr %4, i64 0, i64 0
  store i8 1, ptr %5, align 1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds [32 x i8], ptr %6, i64 0
  %8 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 1
  store i8 0, ptr %8, align 1
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds [32 x i8], ptr %9, i64 0
  %11 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 2
  store i8 1, ptr %11, align 1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds [32 x i8], ptr %12, i64 1
  %14 = getelementptr inbounds [32 x i8], ptr %13, i64 0, i64 0
  store i8 0, ptr %14, align 1
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds [32 x i8], ptr %15, i64 1
  %17 = getelementptr inbounds [32 x i8], ptr %16, i64 0, i64 1
  store i8 1, ptr %17, align 1
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds [32 x i8], ptr %18, i64 1
  %20 = getelementptr inbounds [32 x i8], ptr %19, i64 0, i64 2
  store i8 1, ptr %20, align 1
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds [32 x i8], ptr %21, i64 2
  %23 = getelementptr inbounds [32 x i8], ptr %22, i64 0, i64 0
  store i8 0, ptr %23, align 1
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds [32 x i8], ptr %24, i64 2
  %26 = getelementptr inbounds [32 x i8], ptr %25, i64 0, i64 1
  store i8 1, ptr %26, align 1
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds [32 x i8], ptr %27, i64 2
  %29 = getelementptr inbounds [32 x i8], ptr %28, i64 0, i64 2
  store i8 0, ptr %29, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @uploadField(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %34, %1
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 64
  br i1 %7, label %8, label %37

8:                                                ; preds = %5
  store i32 0, ptr %4, align 4
  br label %9

9:                                                ; preds = %30, %8
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %10, 32
  br i1 %11, label %12, label %33

12:                                               ; preds = %9
  %13 = load ptr, ptr %2, align 8
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [32 x i8], ptr %13, i64 %15
  %17 = load i32, ptr %4, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [32 x i8], ptr %16, i64 0, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %23, label %26

23:                                               ; preds = %12
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr %4, align 4
  call void @fillRealPixels(i32 noundef %24, i32 noundef %25, i32 noundef -1)
  br label %29

26:                                               ; preds = %12
  %27 = load i32, ptr %3, align 4
  %28 = load i32, ptr %4, align 4
  call void @fillRealPixels(i32 noundef %27, i32 noundef %28, i32 noundef 0)
  br label %29

29:                                               ; preds = %26, %23
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %4, align 4
  br label %9, !llvm.loop !9

33:                                               ; preds = %9
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %3, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %3, align 4
  br label %5, !llvm.loop !10

37:                                               ; preds = %5
  call void (...) @simFlush()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @processField(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca [64 x [32 x i8]], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8, align 1
  store ptr %0, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %3, i8 0, i64 2048, i1 false)
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %30, %1
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %8, 64
  br i1 %9, label %10, label %33

10:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %11

11:                                               ; preds = %26, %10
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %12, 32
  br i1 %13, label %14, label %29

14:                                               ; preds = %11
  %15 = load ptr, ptr %2, align 8
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = call signext i8 @checkNeighbours(ptr noundef %15, i32 noundef %16, i32 noundef %17)
  store i8 %18, ptr %6, align 1
  %19 = load i8, ptr %6, align 1
  %20 = load i32, ptr %4, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [64 x [32 x i8]], ptr %3, i64 0, i64 %21
  %23 = load i32, ptr %5, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [32 x i8], ptr %22, i64 0, i64 %24
  store i8 %19, ptr %25, align 1
  br label %26

26:                                               ; preds = %14
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %5, align 4
  br label %11, !llvm.loop !11

29:                                               ; preds = %11
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %4, align 4
  br label %7, !llvm.loop !12

33:                                               ; preds = %7
  %34 = getelementptr inbounds [64 x [32 x i8]], ptr %3, i64 0, i64 0
  %35 = load ptr, ptr %2, align 8
  call void @copyField(ptr noundef %34, ptr noundef %35)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i8 @checkNeighbours(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i8, align 1
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %12 = load i32, ptr %6, align 4
  %13 = call i32 @getXCoordinate(i32 noundef %12)
  store i32 %13, ptr %8, align 4
  %14 = load i32, ptr %7, align 4
  %15 = call i32 @getYCoordinate(i32 noundef %14)
  store i32 %15, ptr %9, align 4
  %16 = load ptr, ptr %5, align 8
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [32 x i8], ptr %16, i64 %18
  %20 = load i32, ptr %7, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [32 x i8], ptr %19, i64 0, i64 %21
  %23 = load i8, ptr %22, align 1
  store i8 %23, ptr %10, align 1
  %24 = load ptr, ptr %5, align 8
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr %7, align 4
  %27 = call signext i8 @countAlive(ptr noundef %24, i32 noundef %25, i32 noundef %26)
  store i8 %27, ptr %11, align 1
  %28 = load i8, ptr %10, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp eq i32 %29, 1
  br i1 %30, label %31, label %41

31:                                               ; preds = %3
  %32 = load i8, ptr %11, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %33, 2
  br i1 %34, label %39, label %35

35:                                               ; preds = %31
  %36 = load i8, ptr %11, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp eq i32 %37, 3
  br i1 %38, label %39, label %40

39:                                               ; preds = %35, %31
  store i8 1, ptr %4, align 1
  br label %47

40:                                               ; preds = %35
  store i8 0, ptr %4, align 1
  br label %47

41:                                               ; preds = %3
  %42 = load i8, ptr %11, align 1
  %43 = sext i8 %42 to i32
  %44 = icmp eq i32 %43, 3
  br i1 %44, label %45, label %46

45:                                               ; preds = %41
  store i8 1, ptr %4, align 1
  br label %47

46:                                               ; preds = %41
  store i8 0, ptr %4, align 1
  br label %47

47:                                               ; preds = %46, %45, %40, %39
  %48 = load i8, ptr %4, align 1
  ret i8 %48
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @fillRealPixels(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %11 = load i32, ptr %4, align 4
  %12 = mul nsw i32 %11, 8
  store i32 %12, ptr %7, align 4
  %13 = load i32, ptr %5, align 4
  %14 = mul nsw i32 %13, 8
  store i32 %14, ptr %8, align 4
  %15 = load i32, ptr %7, align 4
  store i32 %15, ptr %9, align 4
  br label %16

16:                                               ; preds = %36, %3
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %7, align 4
  %19 = add nsw i32 %18, 8
  %20 = icmp slt i32 %17, %19
  br i1 %20, label %21, label %39

21:                                               ; preds = %16
  %22 = load i32, ptr %8, align 4
  store i32 %22, ptr %10, align 4
  br label %23

23:                                               ; preds = %32, %21
  %24 = load i32, ptr %10, align 4
  %25 = load i32, ptr %8, align 4
  %26 = add nsw i32 %25, 8
  %27 = icmp slt i32 %24, %26
  br i1 %27, label %28, label %35

28:                                               ; preds = %23
  %29 = load i32, ptr %9, align 4
  %30 = load i32, ptr %10, align 4
  %31 = load i32, ptr %6, align 4
  call void @simPutPixel(i32 noundef %29, i32 noundef %30, i32 noundef %31)
  br label %32

32:                                               ; preds = %28
  %33 = load i32, ptr %10, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %10, align 4
  br label %23, !llvm.loop !13

35:                                               ; preds = %23
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %9, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %9, align 4
  br label %16, !llvm.loop !14

39:                                               ; preds = %16
  ret void
}

declare void @simFlush(...) #2

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getXCoordinate(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %10

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = add nsw i32 %7, 64
  %9 = srem i32 %8, 64
  store i32 %9, ptr %2, align 4
  br label %13

10:                                               ; preds = %1
  %11 = load i32, ptr %3, align 4
  %12 = srem i32 %11, 64
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %10, %6
  %14 = load i32, ptr %2, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getYCoordinate(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %10

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = add nsw i32 %7, 32
  %9 = srem i32 %8, 32
  store i32 %9, ptr %2, align 4
  br label %13

10:                                               ; preds = %1
  %11 = load i32, ptr %3, align 4
  %12 = srem i32 %11, 32
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %10, %6
  %14 = load i32, ptr %2, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i8 @countAlive(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [32 x i8], ptr %13, i64 %15
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [32 x i8], ptr %16, i64 0, i64 %18
  %20 = load i8, ptr %19, align 1
  store i8 %20, ptr %7, align 1
  %21 = load i8, ptr %7, align 1
  %22 = sext i8 %21 to i32
  %23 = sub nsw i32 0, %22
  %24 = trunc i32 %23 to i8
  store i8 %24, ptr %8, align 1
  store i32 -1, ptr %9, align 4
  br label %25

25:                                               ; preds = %58, %3
  %26 = load i32, ptr %9, align 4
  %27 = icmp slt i32 %26, 2
  br i1 %27, label %28, label %61

28:                                               ; preds = %25
  store i32 -1, ptr %10, align 4
  br label %29

29:                                               ; preds = %54, %28
  %30 = load i32, ptr %10, align 4
  %31 = icmp slt i32 %30, 2
  br i1 %31, label %32, label %57

32:                                               ; preds = %29
  %33 = load i32, ptr %5, align 4
  %34 = load i32, ptr %9, align 4
  %35 = add nsw i32 %33, %34
  %36 = call i32 @getXCoordinate(i32 noundef %35)
  store i32 %36, ptr %11, align 4
  %37 = load i32, ptr %6, align 4
  %38 = load i32, ptr %10, align 4
  %39 = add nsw i32 %37, %38
  %40 = call i32 @getYCoordinate(i32 noundef %39)
  store i32 %40, ptr %12, align 4
  %41 = load i8, ptr %8, align 1
  %42 = sext i8 %41 to i32
  %43 = load ptr, ptr %4, align 8
  %44 = load i32, ptr %11, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [32 x i8], ptr %43, i64 %45
  %47 = load i32, ptr %12, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [32 x i8], ptr %46, i64 0, i64 %48
  %50 = load i8, ptr %49, align 1
  %51 = sext i8 %50 to i32
  %52 = add nsw i32 %42, %51
  %53 = trunc i32 %52 to i8
  store i8 %53, ptr %8, align 1
  br label %54

54:                                               ; preds = %32
  %55 = load i32, ptr %10, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %10, align 4
  br label %29, !llvm.loop !15

57:                                               ; preds = %29
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %9, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %9, align 4
  br label %25, !llvm.loop !16

61:                                               ; preds = %25
  %62 = load i8, ptr %8, align 1
  ret i8 %62
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
