From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 22 Apr 2008 07:42:28 -0700
Subject: [Buildroot] [buildroot 0003054]: error while compiling buildroot
Message-ID: <05435b3bb5becbd344f4ca48761cc345@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3054 
====================================================================== 
Reported By:                gebecom
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3054
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-22-2008 07:42 PDT
Last Modified:              04-22-2008 07:42 PDT
====================================================================== 
Summary:                    error while compiling buildroot
Description: 
wenn i excute make , follows error:
make CC="/usr/bin/gcc" -C package/config conf mconf
make[1]: Entering directory `/build-tools/buildroot/package/config'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -DKBUILD_NO_NLS
-MM *.c > .depend 2>/dev/null || :
make[1]: Leaving directory `/build-tools/buildroot/package/config'
make[1]: Entering directory `/build-tools/buildroot/package/config'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -g -O2 -DKBUILD_NO_NLS 
-c conf.c -o conf.o
In file included from /usr/include/ctype.h:28,
                 from conf.c:6:
/usr/include/bits/types.h:133:2: error: #error
In file included from /usr/include/ctype.h:28,
                 from conf.c:6:
/usr/include/bits/types.h:138: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?__UQUAD_TYPE?
/usr/include/bits/types.h:139: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?unsigned?
/usr/include/bits/types.h:140: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?unsigned?
/usr/include/bits/types.h:141: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?unsigned?
/usr/include/bits/types.h:142: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?__UQUAD_TYPE?
/usr/include/bits/types.h:143: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?unsigned?
/usr/include/bits/types.h:144: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?__UWORD_TYPE?
/usr/include/bits/types.h:145: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?long?
/usr/include/bits/types.h:146: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?__SQUAD_TYPE?
/usr/include/bits/types.h:147: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?int?
/usr/include/bits/types.h:148: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?struct?
/usr/include/bits/types.h:149: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?long?
/usr/include/bits/types.h:150: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?unsigned?
/usr/include/bits/types.h:151: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?__UQUAD_TYPE?
/usr/include/bits/types.h:152: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?unsigned?
/usr/include/bits/types.h:153: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?long?
/usr/include/bits/types.h:154: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?unsigned?
/usr/include/bits/types.h:155: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?long?
/usr/include/bits/types.h:157: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?int?
/usr/include/bits/types.h:158: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?long?
/usr/include/bits/types.h:159: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?int?
/usr/include/bits/types.h:162: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?int?
/usr/include/bits/types.h:165: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?void?
/usr/include/bits/types.h:168: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?long?
/usr/include/bits/types.h:173: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?long?
/usr/include/bits/types.h:174: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?__SQUAD_TYPE?
/usr/include/bits/types.h:177: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?unsigned?
/usr/include/bits/types.h:178: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?__UQUAD_TYPE?
/usr/include/bits/types.h:181: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?unsigned?
/usr/include/bits/types.h:182: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?__UQUAD_TYPE?
/usr/include/bits/types.h:184: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?__SWORD_TYPE?
/usr/include/bits/types.h:188: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?__loff_t?
/usr/include/bits/types.h:193: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?__SWORD_TYPE?
/usr/include/bits/types.h:196: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?unsigned?
In file included from /usr/include/stdlib.h:306,
                 from conf.c:7:
/usr/include/sys/types.h:41: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?fsid_t?
/usr/include/sys/types.h:46: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?loff_t?
/usr/include/sys/types.h:50: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?ino_t?
/usr/include/sys/types.h:62: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?dev_t?
/usr/include/sys/types.h:67: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?gid_t?
/usr/include/sys/types.h:72: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?mode_t?
/usr/include/sys/types.h:77: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?nlink_t?
/usr/include/sys/types.h:82: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?uid_t?
/usr/include/sys/types.h:88: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?off_t?
/usr/include/sys/types.h:100: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?pid_t?
/usr/include/sys/types.h:105: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?id_t?
/usr/include/sys/types.h:110: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?ssize_t?
/usr/include/sys/types.h:116: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?daddr_t?
/usr/include/sys/types.h:123: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?key_t?
In file included from /usr/include/sys/types.h:133,
                 from /usr/include/stdlib.h:306,
                 from conf.c:7:
/usr/include/time.h:77: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?time_t?
/usr/include/time.h:93: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?clockid_t?
/usr/include/time.h:105: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?timer_t?
In file included from /usr/include/sys/select.h:44,
                 from /usr/include/sys/types.h:220,
                 from /usr/include/stdlib.h:306,
                 from conf.c:7:
/usr/include/time.h:123: error: expected specifier-qualifier-list before
?__time_t?
In file included from /usr/include/sys/select.h:46,
                 from /usr/include/sys/types.h:220,
                 from /usr/include/stdlib.h:306,
                 from conf.c:7:
/usr/include/bits/time.h:75: error: expected specifier-qualifier-list
before ?__time_t?
In file included from /usr/include/sys/types.h:220,
                 from /usr/include/stdlib.h:306,
                 from conf.c:7:
/usr/include/sys/select.h:49: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?suseconds_t?
In file included from /usr/include/stdlib.h:306,
                 from conf.c:7:
/usr/include/sys/types.h:235: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?blkcnt_t?
/usr/include/sys/types.h:239: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?fsblkcnt_t?
/usr/include/sys/types.h:243: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?fsfilcnt_t?
In file included from /usr/include/pthread.h:20,
                 from /usr/include/bits/uClibc_mutex.h:15,
                 from /usr/include/bits/uClibc_stdio.h:119,
                 from /usr/include/stdio.h:72,
                 from conf.c:8:
/usr/include/sched.h:40: error: expected ?)? before ?__pid?
/usr/include/sched.h:44: error: expected ?)? before ?__pid?
/usr/include/sched.h:47: error: expected ?)? before ?__pid?
/usr/include/sched.h:51: error: expected ?)? before ?__pid?
/usr/include/sched.h:63: error: expected ?)? before ?__pid?
In file included from /usr/include/pthread.h:21,
                 from /usr/include/bits/uClibc_mutex.h:15,
                 from /usr/include/bits/uClibc_stdio.h:119,
                 from /usr/include/stdio.h:72,
                 from conf.c:8:
/usr/include/time.h:61: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?clock_t?
/usr/include/time.h:186: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?clock?
/usr/include/time.h:189: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?time?
/usr/include/time.h:193: error: expected ?)? before ?__time1?
/usr/include/time.h:198: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?mktime?
/usr/include/time.h:238: error: expected ?;?, ?,? or ?)? before ?*? token
/usr/include/time.h:242: error: expected ?;?, ?,? or ?)? before ?*? token
/usr/include/time.h:248: error: expected ?;?, ?,? or ?)? before ?*? token
/usr/include/time.h:253: error: expected ?;?, ?,? or ?)? before ?*? token
/usr/include/time.h:263: error: expected ?;?, ?,? or ?)? before ?*? token
/usr/include/time.h:275: error: expected ?;?, ?,? or ?)? before ?*? token
/usr/include/time.h:306: error: expected ?;?, ?,? or ?)? before ?*? token
/usr/include/time.h:321: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?timegm?
/usr/include/time.h:324: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?timelocal?
/usr/include/time.h:341: error: expected ?)? before ?__clock_id?
/usr/include/time.h:344: error: expected ?)? before ?__clock_id?
/usr/include/time.h:347: error: expected ?)? before ?__clock_id?
/usr/include/time.h:368: error: expected ?)? before ?__clock_id?
/usr/include/time.h:373: error: expected ?)? before ?__timerid?
/usr/include/time.h:376: error: expected ?)? before ?__timerid?
/usr/include/time.h:381: error: expected ?)? before ?__timerid?
/usr/include/time.h:385: error: expected ?)? before ?__timerid?
In file included from /usr/include/stdio.h:72,
                 from conf.c:8:
/usr/include/bits/uClibc_stdio.h:171: error: expected
specifier-qualifier-list before ?__off_t?
/usr/include/bits/uClibc_stdio.h:182: error: expected
specifier-qualifier-list before ?__off64_t?
/usr/include/bits/uClibc_stdio.h:194: error: expected ?=?, ?,?, ?;?, ?asm?
or ?__attribute__? before ?__offmax_t?
/usr/include/bits/uClibc_stdio.h:202: error: expected ?=?, ?,?, ?;?, ?asm?
or ?__attribute__? before ?__io_read_fn?
/usr/include/bits/uClibc_stdio.h:203: error: expected ?=?, ?,?, ?;?, ?asm?
or ?__attribute__? before ?__io_write_fn?
/usr/include/bits/uClibc_stdio.h:209: error: expected declaration
specifiers or ?...? before ?__offmax_t?
/usr/include/bits/uClibc_stdio.h:213: error: expected
specifier-qualifier-list before ?__io_read_fn?
In file included from conf.c:10:
/usr/include/unistd.h:236: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?intptr_t?
/usr/include/unistd.h:243: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?socklen_t?
/usr/include/unistd.h:299: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?lseek?
/usr/include/unistd.h:325: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?read?
/usr/include/unistd.h:331: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?write?
/usr/include/unistd.h:410: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?ualarm?
/usr/include/unistd.h:418: error: expected ?)? before ?__useconds?
/usr/include/unistd.h:431: error: expected declaration specifiers or ?...?
before ?__uid_t?
/usr/include/unistd.h:431: error: expected declaration specifiers or ?...?
before ?__gid_t?
/usr/include/unistd.h:436: error: expected declaration specifiers or ?...?
before ?__uid_t?
/usr/include/unistd.h:436: error: expected declaration specifiers or ?...?
before ?__gid_t?
/usr/include/unistd.h:441: error: expected declaration specifiers or ?...?
before ?__uid_t?
/usr/include/unistd.h:441: error: expected declaration specifiers or ?...?
before ?__gid_t?
In file included from conf.c:10:
/usr/include/unistd.h:571: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?getpid?
/usr/include/unistd.h:574: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?getppid?
/usr/include/unistd.h:579: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?getpgrp?
/usr/include/unistd.h:589: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?__getpgid?
/usr/include/unistd.h:598: error: expected ?)? before ?__pid?
/usr/include/unistd.h:632: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?setsid?
/usr/include/unistd.h:640: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?getuid?
/usr/include/unistd.h:643: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?geteuid?
/usr/include/unistd.h:646: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?getgid?
/usr/include/unistd.h:649: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?getegid?
/usr/include/unistd.h:654: error: expected declaration specifiers or ?...?
before ?__gid_t?
/usr/include/unistd.h:665: error: expected ?)? before ?__uid?
/usr/include/unistd.h:670: error: expected ?)? before ?__ruid?
/usr/include/unistd.h:675: error: expected ?)? before ?__uid?
/usr/include/unistd.h:682: error: expected ?)? before ?__gid?
/usr/include/unistd.h:687: error: expected ?)? before ?__rgid?
/usr/include/unistd.h:692: error: expected ?)? before ?__gid?
/usr/include/unistd.h:722: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?fork?
/usr/include/unistd.h:730: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?vfork?
/usr/include/unistd.h:775: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?readlink?
/usr/include/unistd.h:805: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?tcgetpgrp?
/usr/include/unistd.h:808: error: expected declaration specifiers or ?...?
before ?__pid_t?
In file included from conf.c:10:
/usr/include/unistd.h:953: error: expected declaration specifiers or ?...?
before ?__off_t?
/usr/include/unistd.h:975: error: expected declaration specifiers or ?...?
before ?__off_t?
/usr/include/unistd.h:1001: error: expected ?)? before ?__delta?
/usr/include/unistd.h:1039: error: expected declaration specifiers or
?...? before ?__off_t?
In file included from /usr/include/sys/stat.h:105,
                 from conf.c:12:
/usr/include/bits/stat.h:88: error: expected specifier-qualifier-list
before ?__ino_t?
In file included from conf.c:12:
/usr/include/sys/stat.h:280: error: expected declaration specifiers or
?...? before ?__mode_t?
/usr/include/sys/stat.h:293: error: expected declaration specifiers or
?...? before ?__mode_t?
/usr/include/sys/stat.h:307: error: expected ?=?, ?,?, ?;?, ?asm? or
?__attribute__? before ?umask?
/usr/include/sys/stat.h:316: error: expected declaration specifiers or
?...? before ?__mode_t?
/usr/include/sys/stat.h:331: error: expected declaration specifiers or
?...? before ?__mode_t?
/usr/include/sys/stat.h:331: error: expected declaration specifiers or
?...? before ?__dev_t?
/usr/include/sys/stat.h:345: error: expected declaration specifiers or
?...? before ?__mode_t?
make[1]: *** [conf.o] Error 1
make[1]: Leaving directory `/build-tools/buildroot/package/config'
make: *** [package/config/mconf] Error 2


please guide me!!!
what is it!
i have buildroot successfully compiled, but i dont know, why appeares the
error.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-22-08 07:42  gebecom        New Issue                                    
04-22-08 07:42  gebecom        Status                   new => assigned     
04-22-08 07:42  gebecom        Assigned To               => buildroot       
======================================================================
