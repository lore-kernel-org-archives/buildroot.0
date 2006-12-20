From: Rory Slegtenhorst <rory.slegtenhorst@gmail.com>
Date: Wed, 20 Dec 2006 12:44:26 +0100
Subject: [Buildroot] Errors while building iproute2
Message-ID: <5e15b0e10612200344u75903c18m80e72d5322cdc451@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Renewed my buildroot env to the latest svn, and updated the various
toolchain selections.
Now my iproute2 fails:
flex  -oemp_ematch.lex.c emp_ematch.l
/cd-linux/buildroot/build_i386/staging_dir/bin/i386-linux-uclibc-gcc
-D_GNU_SOURCE -Os -pipe  -DHAVE_GETTIMEOFDAY_TZ -I../include
-DRESOLVE_HOSTNAMES -DCONFIG_GACT -DCONFIG_GACT_PROB   -c -o
emp_ematch.lex.o emp_ematch.lex.c
emp_ematch.lex.c:1686: error: syntax error before numeric constant
emp_ematch.lex.c: In function `ematch__scan_string':
emp_ematch.lex.c:1687: error: number of arguments doesn't match prototype
emp_ematch.lex.c:298: error: prototype declaration
emp_ematch.lex.c:1689: warning: passing arg 1 of `strlen' makes
pointer from integer without a cast
emp_ematch.lex.c:1689: warning: passing arg 1 of `ematch__scan_bytes'
makes pointer from integer without a cast
make[2]: *** [emp_ematch.lex.o] Error 1
rm emp_ematch.lex.c

Any idea's are welcome...

Thanks,
-- 
Rory Slegtenhorst
rory dot slegtenhorst at gmail dot com
