From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Aug 2020 17:33:53 +0200
Subject: [Buildroot] [PATCH 1/1] Update Jasper to 2.0.19
In-Reply-To: <20200729131556.21361-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Wed, 29 Jul 2020 15:15:56 +0200")
References: <20200729131556.21361-1-jubalh@iodoru.org>
Message-ID: <87wo1wynmm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > Changes:
 > * Fix CVE-2018-9154
 >   https://github.com/jasper-software/jasper/issues/215
 >   https://github.com/jasper-software/jasper/issues/166
 >   https://github.com/jasper-software/jasper/issues/175
 >   https://github.com/jasper-maint/jasper/issues/8

 > * Fix CVE-2018-19541
 >   https://github.com/jasper-software/jasper/pull/199
 >   https://github.com/jasper-maint/jasper/issues/6

 > * Fix CVE-2016-9399, CVE-2017-13751
 >   https://github.com/jasper-maint/jasper/issues/1

 > * Fix CVE-2018-19540
 >   https://github.com/jasper-software/jasper/issues/182
 >   https://github.com/jasper-maint/jasper/issues/22

 > * Fix CVE-2018-9055
 >   https://github.com/jasper-maint/jasper/issues/9

 > * Fix CVE-2017-13748
 >   https://github.com/jasper-software/jasper/issues/168

 > * Fix CVE-2017-5503, CVE-2017-5504, CVE-2017-5505
 >   https://github.com/jasper-maint/jasper/issues/3
 >   https://github.com/jasper-maint/jasper/issues/4
 >   https://github.com/jasper-maint/jasper/issues/5
 >   https://github.com/jasper-software/jasper/issues/88
 >   https://github.com/jasper-software/jasper/issues/89
 >   https://github.com/jasper-software/jasper/issues/90

 > * Fix CVE-2018-9252
 >   https://github.com/jasper-maint/jasper/issues/16

 > * Fix CVE-2018-19139
 >   https://github.com/jasper-maint/jasper/issues/14

 > * Fix CVE-2018-19543, CVE-2017-9782
 >   https://github.com/jasper-maint/jasper/issues/13
 >   https://github.com/jasper-maint/jasper/issues/18
 >   https://github.com/jasper-software/jasper/issues/140
 >   https://github.com/jasper-software/jasper/issues/182

 > * Fix CVE-2018-20570
 >   https://github.com/jasper-maint/jasper/issues/11
 >   https://github.com/jasper-software/jasper/issues/191

 > * Fix CVE-2018-20622
 >   https://github.com/jasper-maint/jasper/issues/12
 >   https://github.com/jasper-software/jasper/issues/193

 > * Fix CVE-2016-9398
 >   https://github.com/jasper-maint/jasper/issues/10

 > * Fix CVE-2017-14132
 >   https://github.com/jasper-maint/jasper/issues/17

 > * Fix CVE-2017-5499
 >   https://github.com/jasper-maint/jasper/issues/2
 >   https://github.com/jasper-software/jasper/issues/63

 > * Fix CVE-2018-18873
 >   https://github.com/jasper-maint/jasper/issues/15
 >   https://github.com/jasper-software/jasper/issues/184

 > * Fix https://github.com/jasper-software/jasper/issues/207

 > * Fix https://github.com/jasper-software/jasper/issues/194 part 1

 > * Fix CVE-2017-13750
 >   https://github.com/jasper-software/jasper/issues/165
 >   https://github.com/jasper-software/jasper/issues/174

 > * New option -DJAS_ENABLE_HIDDEN=true to not export internal symbols in the public symbol table

 > * Fix various memory leaks

 > * Plenty of code cleanups, and performance improvements

 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
