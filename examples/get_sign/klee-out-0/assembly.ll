; ModuleID = 'examples/get_sign/get_sign.bc'
source_filename = "examples/get_sign/get_sign.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @get_sign(i32 %x) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %x.addr, align 4, !dbg !13
  %cmp = icmp eq i32 %0, 0, !dbg !15
  br i1 %cmp, label %if.then, label %if.end, !dbg !16

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !17
  br label %return, !dbg !17

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %x.addr, align 4, !dbg !18
  %cmp1 = icmp slt i32 %1, 0, !dbg !20
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !21

if.then2:                                         ; preds = %if.end
  store i32 -1, i32* %retval, align 4, !dbg !22
  br label %return, !dbg !22

if.else:                                          ; preds = %if.end
  store i32 1, i32* %retval, align 4, !dbg !23
  br label %return, !dbg !23

return:                                           ; preds = %if.else, %if.then2, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !24
  ret i32 %2, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !25 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = bitcast i32* %a to i8*, !dbg !30
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !31
  %1 = load i32, i32* %a, align 4, !dbg !32
  %call = call i32 @get_sign(i32 %1), !dbg !33
  ret i32 %call, !dbg !34
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214614.8", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "examples/get_sign/get_sign.c", directory: "/home/tareq/docker-all/klee-2.3")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214614.8"}
!7 = distinct !DISubprogram(name: "get_sign", scope: !1, file: !1, line: 7, type: !8, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !1, line: 7, type: !10)
!12 = !DILocation(line: 7, column: 18, scope: !7)
!13 = !DILocation(line: 8, column: 7, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 7)
!15 = !DILocation(line: 8, column: 9, scope: !14)
!16 = !DILocation(line: 8, column: 7, scope: !7)
!17 = !DILocation(line: 9, column: 6, scope: !14)
!18 = !DILocation(line: 11, column: 7, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 7)
!20 = !DILocation(line: 11, column: 9, scope: !19)
!21 = !DILocation(line: 11, column: 7, scope: !7)
!22 = !DILocation(line: 12, column: 6, scope: !19)
!23 = !DILocation(line: 14, column: 6, scope: !19)
!24 = !DILocation(line: 15, column: 1, scope: !7)
!25 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 17, type: !26, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!10}
!28 = !DILocalVariable(name: "a", scope: !25, file: !1, line: 18, type: !10)
!29 = !DILocation(line: 18, column: 7, scope: !25)
!30 = !DILocation(line: 19, column: 22, scope: !25)
!31 = !DILocation(line: 19, column: 3, scope: !25)
!32 = !DILocation(line: 20, column: 19, scope: !25)
!33 = !DILocation(line: 20, column: 10, scope: !25)
!34 = !DILocation(line: 20, column: 3, scope: !25)
