From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 29 Nov 2009 14:08:29 -0600
Subject: [Buildroot] Target uClibc test fail vector
Message-ID: <200911291408.31698.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anyone know if this is a reasonable set of failing tests?
Any link anywhere to the expected test pass/fail sets for this library?

My results:

deb2core:/mnt/sqf1/lib# file libuClibc-0.9.30.1.so

libuClibc-0.9.30.1.so: ELF 32-bit LSB shared object, MIPS, MIPS32 rel2
version 1 (SYSV), dynamically linked (uses shared libs),
with unknown capability 0xf41 = 0x756e6700, stripped

TESTS_DISABLED=

tst-ethers-line
tst-ethers
tst_iswctype
tst_swscanf
tst_towctrans
tst_wcrtomb
tst_wcscoll
tst_wcsrtombs
tst_wcstod
tst_wcstombs
tst_wctrans
tst_wctype
tst_strfmon
bug-iconv-trans
bug-usesetlocale
collate-test
gen-unicode-ctype
dump-ctype
tst-ctype
tst-digits
tst-fmon
tst-langinfo
tst-leaks
tst-numeric
tst-rpmatch
tst-sscanf
tst-strmon1
tst-strfmon1
tst-trans
tst-wctype
tst-xlocale1
tst-xlocale2
xfrm-test
time_malloc
test-float
test-ifloat
test-double
test-idouble
bug-glob1
outb
tst-fnmatch
tst-gnuglob
mmap2
cancellation-points
tst-sigsimple
bug-asctime
bug
-asctime_r
time
tst-ftime_l
testregexi
tst-mktime2
tst-posixtz
tst-strftime
tst-strptime
tst-timezone
tst_wcsftime
exec-null


Mike
