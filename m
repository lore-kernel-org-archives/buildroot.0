From: =?UTF-8?B?KioqKiogKioqKio=?= <zyama.abel@mail.ru>
Date: Fri, 11 May 2018 13:53:40 +0300
Subject: [Buildroot] =?utf-8?q?BUG=3A_BR-2018=2E05-rc1_cannot_build_dahdi?=
 =?utf-8?q?-linux_2=2E11=2E1?=
Message-ID: <1526036020.685182559@f413.i.mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


--2018-05-11 10:40:40--? ?
http://downloads.digium.com/pu b/telephony/firmware/releases/ dahdi-fw-te436-10017.tar.gz
Resolving proxy.telros.lan (proxy.myname.lan)... 192.35.10.45
Connecting to proxy.telros.lan (proxy.myname.lan)|192.35.10.4 5|:2020... ?
connected.
Proxy request sent, awaiting response... 200 OK
Length: 210601 (206K) [application/x-gzip]
Saving to: ?
'/buildroot/output/build/.dahd i-fw-te436-10017.tar.gz.s6cXtq /output'

/buildroot/output/build/.dahdi -fw-te436- ?
100%[========================= ============================== ==========================>] ?
205.67K? --.-KB/s? ? in 0.05s

2018-05-11 10:40:40 (4.20 MB/s) - ?
'/buildroot/output/build/.dahd i-fw-te436-10017.tar.gz.s6cXtq /output' ?
saved [210601/210601]

dahdi-fw-te436-10017.tar.gz: OK (sha256: ?
0980f4a8d191c6872aa27d97175804 6f0e7827ac161549f2cc1b0eeab0ae 9333)
>>> dahdi-linux 2.11.1 Extracting
gzip -d -c /buildroot/dl/dahdi-linux/dahd i-linux-2.11.1.tar.gz | tar ?
--strip-components=1 -C /buildroot/output/build/dahdi- linux-2.11.1? ?-xf ?
-
cp "/buildroot/dl"/dahdi-fwload-v pmadt032-1.25.0.tar.gz ?
/buildroot/output/build/dahdi- linux-2.11.1/drivers/dahdi/fir mware/dahdi-fwload-vpmadt032- 1.25.0.tar.gz
cp: cannot stat '/buildroot/dl/dahdi-fwload-vp madt032-1.25.0.tar.gz': No ?
such file or directory
package/ pkg-generic.mk:156 : recipe for target ?
'/buildroot/output/build/dahdi -linux-2.11.1/.stamp_extracted ' failed
make: *** [/buildroot/output/build/dahdi -linux-2.11.1/.stamp_extracted ]
Error 1

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180511/cbf6300f/attachment.html>
