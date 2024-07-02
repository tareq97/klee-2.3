; ModuleID = 'examples/regexp/regexp.bc'
source_filename = "examples/regexp/regexp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"re\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"hello\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @match(i8* %re, i8* %text) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %re.addr = alloca i8*, align 8
  %text.addr = alloca i8*, align 8
  store i8* %re, i8** %re.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %re.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i8* %text, i8** %text.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %text.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** %re.addr, align 8, !dbg !17
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !17
  %1 = load i8, i8* %arrayidx, align 1, !dbg !17
  %conv = sext i8 %1 to i32, !dbg !17
  %cmp = icmp eq i32 %conv, 94, !dbg !19
  br i1 %cmp, label %if.then, label %if.end, !dbg !20

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %re.addr, align 8, !dbg !21
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 1, !dbg !22
  %3 = load i8*, i8** %text.addr, align 8, !dbg !23
  %call = call i32 @matchhere(i8* %add.ptr, i8* %3), !dbg !24
  store i32 %call, i32* %retval, align 4, !dbg !25
  br label %return, !dbg !25

if.end:                                           ; preds = %entry
  br label %do.body, !dbg !26

do.body:                                          ; preds = %do.cond, %if.end
  %4 = load i8*, i8** %re.addr, align 8, !dbg !27
  %5 = load i8*, i8** %text.addr, align 8, !dbg !30
  %call2 = call i32 @matchhere(i8* %4, i8* %5), !dbg !31
  %tobool = icmp ne i32 %call2, 0, !dbg !31
  br i1 %tobool, label %if.then3, label %if.end4, !dbg !32

if.then3:                                         ; preds = %do.body
  store i32 1, i32* %retval, align 4, !dbg !33
  br label %return, !dbg !33

if.end4:                                          ; preds = %do.body
  br label %do.cond, !dbg !34

do.cond:                                          ; preds = %if.end4
  %6 = load i8*, i8** %text.addr, align 8, !dbg !35
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !35
  store i8* %incdec.ptr, i8** %text.addr, align 8, !dbg !35
  %7 = load i8, i8* %6, align 1, !dbg !36
  %conv5 = sext i8 %7 to i32, !dbg !36
  %cmp6 = icmp ne i32 %conv5, 0, !dbg !37
  br i1 %cmp6, label %do.body, label %do.end, !dbg !34, !llvm.loop !38

do.end:                                           ; preds = %do.cond
  store i32 0, i32* %retval, align 4, !dbg !40
  br label %return, !dbg !40

return:                                           ; preds = %do.end, %if.then3, %if.then
  %8 = load i32, i32* %retval, align 4, !dbg !41
  ret i32 %8, !dbg !41
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @matchhere(i8* %re, i8* %text) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %re.addr = alloca i8*, align 8
  %text.addr = alloca i8*, align 8
  store i8* %re, i8** %re.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %re.addr, metadata !43, metadata !DIExpression()), !dbg !44
  store i8* %text, i8** %text.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %text.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i8*, i8** %re.addr, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !47
  %1 = load i8, i8* %arrayidx, align 1, !dbg !47
  %conv = sext i8 %1 to i32, !dbg !47
  %cmp = icmp eq i32 %conv, 0, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !51
  br label %return, !dbg !51

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %re.addr, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 1, !dbg !52
  %3 = load i8, i8* %arrayidx2, align 1, !dbg !52
  %conv3 = sext i8 %3 to i32, !dbg !52
  %cmp4 = icmp eq i32 %conv3, 42, !dbg !54
  br i1 %cmp4, label %if.then6, label %if.end9, !dbg !55

if.then6:                                         ; preds = %if.end
  %4 = load i8*, i8** %re.addr, align 8, !dbg !56
  %arrayidx7 = getelementptr inbounds i8, i8* %4, i64 0, !dbg !56
  %5 = load i8, i8* %arrayidx7, align 1, !dbg !56
  %conv8 = sext i8 %5 to i32, !dbg !56
  %6 = load i8*, i8** %re.addr, align 8, !dbg !57
  %add.ptr = getelementptr inbounds i8, i8* %6, i64 2, !dbg !58
  %7 = load i8*, i8** %text.addr, align 8, !dbg !59
  %call = call i32 @matchstar(i32 %conv8, i8* %add.ptr, i8* %7), !dbg !60
  store i32 %call, i32* %retval, align 4, !dbg !61
  br label %return, !dbg !61

if.end9:                                          ; preds = %if.end
  %8 = load i8*, i8** %re.addr, align 8, !dbg !62
  %arrayidx10 = getelementptr inbounds i8, i8* %8, i64 0, !dbg !62
  %9 = load i8, i8* %arrayidx10, align 1, !dbg !62
  %conv11 = sext i8 %9 to i32, !dbg !62
  %cmp12 = icmp eq i32 %conv11, 36, !dbg !64
  br i1 %cmp12, label %land.lhs.true, label %if.end22, !dbg !65

land.lhs.true:                                    ; preds = %if.end9
  %10 = load i8*, i8** %re.addr, align 8, !dbg !66
  %arrayidx14 = getelementptr inbounds i8, i8* %10, i64 1, !dbg !66
  %11 = load i8, i8* %arrayidx14, align 1, !dbg !66
  %conv15 = sext i8 %11 to i32, !dbg !66
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !67
  br i1 %cmp16, label %if.then18, label %if.end22, !dbg !68

if.then18:                                        ; preds = %land.lhs.true
  %12 = load i8*, i8** %text.addr, align 8, !dbg !69
  %13 = load i8, i8* %12, align 1, !dbg !70
  %conv19 = sext i8 %13 to i32, !dbg !70
  %cmp20 = icmp eq i32 %conv19, 0, !dbg !71
  %conv21 = zext i1 %cmp20 to i32, !dbg !71
  store i32 %conv21, i32* %retval, align 4, !dbg !72
  br label %return, !dbg !72

if.end22:                                         ; preds = %land.lhs.true, %if.end9
  %14 = load i8*, i8** %text.addr, align 8, !dbg !73
  %15 = load i8, i8* %14, align 1, !dbg !75
  %conv23 = sext i8 %15 to i32, !dbg !75
  %cmp24 = icmp ne i32 %conv23, 0, !dbg !76
  br i1 %cmp24, label %land.lhs.true26, label %if.end40, !dbg !77

land.lhs.true26:                                  ; preds = %if.end22
  %16 = load i8*, i8** %re.addr, align 8, !dbg !78
  %arrayidx27 = getelementptr inbounds i8, i8* %16, i64 0, !dbg !78
  %17 = load i8, i8* %arrayidx27, align 1, !dbg !78
  %conv28 = sext i8 %17 to i32, !dbg !78
  %cmp29 = icmp eq i32 %conv28, 46, !dbg !79
  br i1 %cmp29, label %if.then36, label %lor.lhs.false, !dbg !80

lor.lhs.false:                                    ; preds = %land.lhs.true26
  %18 = load i8*, i8** %re.addr, align 8, !dbg !81
  %arrayidx31 = getelementptr inbounds i8, i8* %18, i64 0, !dbg !81
  %19 = load i8, i8* %arrayidx31, align 1, !dbg !81
  %conv32 = sext i8 %19 to i32, !dbg !81
  %20 = load i8*, i8** %text.addr, align 8, !dbg !82
  %21 = load i8, i8* %20, align 1, !dbg !83
  %conv33 = sext i8 %21 to i32, !dbg !83
  %cmp34 = icmp eq i32 %conv32, %conv33, !dbg !84
  br i1 %cmp34, label %if.then36, label %if.end40, !dbg !85

if.then36:                                        ; preds = %lor.lhs.false, %land.lhs.true26
  %22 = load i8*, i8** %re.addr, align 8, !dbg !86
  %add.ptr37 = getelementptr inbounds i8, i8* %22, i64 1, !dbg !87
  %23 = load i8*, i8** %text.addr, align 8, !dbg !88
  %add.ptr38 = getelementptr inbounds i8, i8* %23, i64 1, !dbg !89
  %call39 = call i32 @matchhere(i8* %add.ptr37, i8* %add.ptr38), !dbg !90
  store i32 %call39, i32* %retval, align 4, !dbg !91
  br label %return, !dbg !91

if.end40:                                         ; preds = %lor.lhs.false, %if.end22
  store i32 0, i32* %retval, align 4, !dbg !92
  br label %return, !dbg !92

return:                                           ; preds = %if.end40, %if.then36, %if.then18, %if.then6, %if.then
  %24 = load i32, i32* %retval, align 4, !dbg !93
  ret i32 %24, !dbg !93
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %re = alloca [7 x i8], align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [7 x i8]* %re, metadata !97, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [7 x i8], [7 x i8]* %re, i64 0, i64 0, !dbg !102
  call void @klee_make_symbolic(i8* %arraydecay, i64 7, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !103
  %arraydecay1 = getelementptr inbounds [7 x i8], [7 x i8]* %re, i64 0, i64 0, !dbg !104
  %call = call i32 @match(i8* %arraydecay1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @matchstar(i32 %c, i8* %re, i8* %text) #0 !dbg !107 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %re.addr = alloca i8*, align 8
  %text.addr = alloca i8*, align 8
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8* %re, i8** %re.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %re.addr, metadata !112, metadata !DIExpression()), !dbg !113
  store i8* %text, i8** %text.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %text.addr, metadata !114, metadata !DIExpression()), !dbg !115
  br label %do.body, !dbg !116

do.body:                                          ; preds = %land.end, %entry
  %0 = load i8*, i8** %re.addr, align 8, !dbg !117
  %1 = load i8*, i8** %text.addr, align 8, !dbg !120
  %call = call i32 @matchhere(i8* %0, i8* %1), !dbg !121
  %tobool = icmp ne i32 %call, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %do.body
  store i32 1, i32* %retval, align 4, !dbg !123
  br label %return, !dbg !123

if.end:                                           ; preds = %do.body
  br label %do.cond, !dbg !124

do.cond:                                          ; preds = %if.end
  %2 = load i8*, i8** %text.addr, align 8, !dbg !125
  %3 = load i8, i8* %2, align 1, !dbg !126
  %conv = sext i8 %3 to i32, !dbg !126
  %cmp = icmp ne i32 %conv, 0, !dbg !127
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !128

land.rhs:                                         ; preds = %do.cond
  %4 = load i8*, i8** %text.addr, align 8, !dbg !129
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1, !dbg !129
  store i8* %incdec.ptr, i8** %text.addr, align 8, !dbg !129
  %5 = load i8, i8* %4, align 1, !dbg !130
  %conv2 = sext i8 %5 to i32, !dbg !130
  %6 = load i32, i32* %c.addr, align 4, !dbg !131
  %cmp3 = icmp eq i32 %conv2, %6, !dbg !132
  br i1 %cmp3, label %lor.end, label %lor.rhs, !dbg !133

lor.rhs:                                          ; preds = %land.rhs
  %7 = load i32, i32* %c.addr, align 4, !dbg !134
  %cmp5 = icmp eq i32 %7, 46, !dbg !135
  br label %lor.end, !dbg !133

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %8 = phi i1 [ true, %land.rhs ], [ %cmp5, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %do.cond
  %9 = phi i1 [ false, %do.cond ], [ %8, %lor.end ], !dbg !136
  br i1 %9, label %do.body, label %do.end, !dbg !124, !llvm.loop !137

do.end:                                           ; preds = %land.end
  store i32 0, i32* %retval, align 4, !dbg !139
  br label %return, !dbg !139

return:                                           ; preds = %do.end, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !140
  ret i32 %10, !dbg !140
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214614.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "examples/regexp/regexp.c", directory: "/home/tareq/docker-all/klee-2.3")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214614.8"}
!7 = distinct !DISubprogram(name: "match", scope: !1, file: !1, line: 34, type: !8, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DILocalVariable(name: "re", arg: 1, scope: !7, file: !1, line: 34, type: !11)
!14 = !DILocation(line: 34, column: 17, scope: !7)
!15 = !DILocalVariable(name: "text", arg: 2, scope: !7, file: !1, line: 34, type: !11)
!16 = !DILocation(line: 34, column: 27, scope: !7)
!17 = !DILocation(line: 35, column: 7, scope: !18)
!18 = distinct !DILexicalBlock(scope: !7, file: !1, line: 35, column: 7)
!19 = !DILocation(line: 35, column: 13, scope: !18)
!20 = !DILocation(line: 35, column: 7, scope: !7)
!21 = !DILocation(line: 36, column: 22, scope: !18)
!22 = !DILocation(line: 36, column: 24, scope: !18)
!23 = !DILocation(line: 36, column: 28, scope: !18)
!24 = !DILocation(line: 36, column: 12, scope: !18)
!25 = !DILocation(line: 36, column: 5, scope: !18)
!26 = !DILocation(line: 37, column: 3, scope: !7)
!27 = !DILocation(line: 38, column: 19, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !1, line: 38, column: 9)
!29 = distinct !DILexicalBlock(scope: !7, file: !1, line: 37, column: 6)
!30 = !DILocation(line: 38, column: 23, scope: !28)
!31 = !DILocation(line: 38, column: 9, scope: !28)
!32 = !DILocation(line: 38, column: 9, scope: !29)
!33 = !DILocation(line: 39, column: 7, scope: !28)
!34 = !DILocation(line: 40, column: 3, scope: !29)
!35 = !DILocation(line: 40, column: 17, scope: !7)
!36 = !DILocation(line: 40, column: 12, scope: !7)
!37 = !DILocation(line: 40, column: 20, scope: !7)
!38 = distinct !{!38, !26, !39}
!39 = !DILocation(line: 40, column: 27, scope: !7)
!40 = !DILocation(line: 41, column: 3, scope: !7)
!41 = !DILocation(line: 42, column: 1, scope: !7)
!42 = distinct !DISubprogram(name: "matchhere", scope: !1, file: !1, line: 22, type: !8, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "re", arg: 1, scope: !42, file: !1, line: 22, type: !11)
!44 = !DILocation(line: 22, column: 28, scope: !42)
!45 = !DILocalVariable(name: "text", arg: 2, scope: !42, file: !1, line: 22, type: !11)
!46 = !DILocation(line: 22, column: 38, scope: !42)
!47 = !DILocation(line: 23, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !1, line: 23, column: 7)
!49 = !DILocation(line: 23, column: 13, scope: !48)
!50 = !DILocation(line: 23, column: 7, scope: !42)
!51 = !DILocation(line: 24, column: 6, scope: !48)
!52 = !DILocation(line: 25, column: 7, scope: !53)
!53 = distinct !DILexicalBlock(scope: !42, file: !1, line: 25, column: 7)
!54 = !DILocation(line: 25, column: 13, scope: !53)
!55 = !DILocation(line: 25, column: 7, scope: !42)
!56 = !DILocation(line: 26, column: 22, scope: !53)
!57 = !DILocation(line: 26, column: 29, scope: !53)
!58 = !DILocation(line: 26, column: 31, scope: !53)
!59 = !DILocation(line: 26, column: 35, scope: !53)
!60 = !DILocation(line: 26, column: 12, scope: !53)
!61 = !DILocation(line: 26, column: 5, scope: !53)
!62 = !DILocation(line: 27, column: 7, scope: !63)
!63 = distinct !DILexicalBlock(scope: !42, file: !1, line: 27, column: 7)
!64 = !DILocation(line: 27, column: 13, scope: !63)
!65 = !DILocation(line: 27, column: 20, scope: !63)
!66 = !DILocation(line: 27, column: 23, scope: !63)
!67 = !DILocation(line: 27, column: 28, scope: !63)
!68 = !DILocation(line: 27, column: 7, scope: !42)
!69 = !DILocation(line: 28, column: 13, scope: !63)
!70 = !DILocation(line: 28, column: 12, scope: !63)
!71 = !DILocation(line: 28, column: 18, scope: !63)
!72 = !DILocation(line: 28, column: 5, scope: !63)
!73 = !DILocation(line: 29, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !42, file: !1, line: 29, column: 7)
!75 = !DILocation(line: 29, column: 7, scope: !74)
!76 = !DILocation(line: 29, column: 12, scope: !74)
!77 = !DILocation(line: 29, column: 19, scope: !74)
!78 = !DILocation(line: 29, column: 23, scope: !74)
!79 = !DILocation(line: 29, column: 28, scope: !74)
!80 = !DILocation(line: 29, column: 34, scope: !74)
!81 = !DILocation(line: 29, column: 37, scope: !74)
!82 = !DILocation(line: 29, column: 45, scope: !74)
!83 = !DILocation(line: 29, column: 44, scope: !74)
!84 = !DILocation(line: 29, column: 42, scope: !74)
!85 = !DILocation(line: 29, column: 7, scope: !42)
!86 = !DILocation(line: 30, column: 22, scope: !74)
!87 = !DILocation(line: 30, column: 24, scope: !74)
!88 = !DILocation(line: 30, column: 28, scope: !74)
!89 = !DILocation(line: 30, column: 32, scope: !74)
!90 = !DILocation(line: 30, column: 12, scope: !74)
!91 = !DILocation(line: 30, column: 5, scope: !74)
!92 = !DILocation(line: 31, column: 3, scope: !42)
!93 = !DILocation(line: 32, column: 1, scope: !42)
!94 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 51, type: !95, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!10}
!97 = !DILocalVariable(name: "re", scope: !94, file: !1, line: 53, type: !98)
!98 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 56, elements: !99)
!99 = !{!100}
!100 = !DISubrange(count: 7)
!101 = !DILocation(line: 53, column: 8, scope: !94)
!102 = !DILocation(line: 56, column: 22, scope: !94)
!103 = !DILocation(line: 56, column: 3, scope: !94)
!104 = !DILocation(line: 59, column: 9, scope: !94)
!105 = !DILocation(line: 59, column: 3, scope: !94)
!106 = !DILocation(line: 61, column: 3, scope: !94)
!107 = distinct !DISubprogram(name: "matchstar", scope: !1, file: !1, line: 14, type: !108, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DISubroutineType(types: !109)
!109 = !{!10, !10, !11, !11}
!110 = !DILocalVariable(name: "c", arg: 1, scope: !107, file: !1, line: 14, type: !10)
!111 = !DILocation(line: 14, column: 26, scope: !107)
!112 = !DILocalVariable(name: "re", arg: 2, scope: !107, file: !1, line: 14, type: !11)
!113 = !DILocation(line: 14, column: 35, scope: !107)
!114 = !DILocalVariable(name: "text", arg: 3, scope: !107, file: !1, line: 14, type: !11)
!115 = !DILocation(line: 14, column: 45, scope: !107)
!116 = !DILocation(line: 15, column: 3, scope: !107)
!117 = !DILocation(line: 16, column: 19, scope: !118)
!118 = distinct !DILexicalBlock(scope: !119, file: !1, line: 16, column: 9)
!119 = distinct !DILexicalBlock(scope: !107, file: !1, line: 15, column: 6)
!120 = !DILocation(line: 16, column: 23, scope: !118)
!121 = !DILocation(line: 16, column: 9, scope: !118)
!122 = !DILocation(line: 16, column: 9, scope: !119)
!123 = !DILocation(line: 17, column: 7, scope: !118)
!124 = !DILocation(line: 18, column: 3, scope: !119)
!125 = !DILocation(line: 18, column: 13, scope: !107)
!126 = !DILocation(line: 18, column: 12, scope: !107)
!127 = !DILocation(line: 18, column: 18, scope: !107)
!128 = !DILocation(line: 18, column: 26, scope: !107)
!129 = !DILocation(line: 18, column: 35, scope: !107)
!130 = !DILocation(line: 18, column: 30, scope: !107)
!131 = !DILocation(line: 18, column: 41, scope: !107)
!132 = !DILocation(line: 18, column: 38, scope: !107)
!133 = !DILocation(line: 18, column: 43, scope: !107)
!134 = !DILocation(line: 18, column: 46, scope: !107)
!135 = !DILocation(line: 18, column: 47, scope: !107)
!136 = !DILocation(line: 0, scope: !107)
!137 = distinct !{!137, !116, !138}
!138 = !DILocation(line: 18, column: 54, scope: !107)
!139 = !DILocation(line: 19, column: 3, scope: !107)
!140 = !DILocation(line: 20, column: 1, scope: !107)
