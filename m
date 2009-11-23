From: laplace <daniel.kuhne@yahoo.de>
Date: Mon, 23 Nov 2009 11:08:16 -0800 (PST)
Subject: [Buildroot]  rxvt: build errors - what to do?
Message-ID: <26481849.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


(edit to be resent to list)
Hi,

i got errors when selecting rxvt from buildroot <Package Selection for the
target>.
Can anyone say what to do here? Thx eric.

[...]
rxvt.c:15: error: expected declaration or statement at end of input
rxvt.c: In function 'rxvt_tt_printf':
rxvt.c:15: error: expected declaration or statement at end of input
rxvt.c: In function 'rxvt_check_our_parents':
rxvt.c:15: error: expected declaration or statement at end of input
rxvt.c: In function 'rxvt_cmd_write':
rxvt.c:15: error: expected declaration or statement at end of input
make[2]: *** [rxvt.o] Fehler 1
make[2]: Leaving directory
`/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5/src'
make[2]: Entering directory
`/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5/doc'
make[2]: F?r das Ziel ?all? ist nichts zu tun.
make[2]: Leaving directory
`/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5/doc'
make[2]: Entering directory
`/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5/rclock'
make[2]: F?r das Ziel ?all? ist nichts zu tun.
make[2]: Leaving directory
`/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5/rclock'
make[2]: Entering directory
`/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5/src/graphics'
make[2]: F?r das Ziel ?all? ist nichts zu tun.
make[2]: Leaving directory
`/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5/src/graphics'
make[2]: Entering directory
`/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5/src/test'
make[2]: F?r das Ziel ?all? ist nichts zu tun.
make[2]: Leaving directory
`/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5/src/test'
make[1]: Leaving directory
`/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5'
/opt/BuildRoot/buildroot-2009.08/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-strip
--remove-section=.comment --remove-section=.note --discard-all
/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5/src/rxvt
/opt/BuildRoot/buildroot-2009.08/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-strip:
'/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5/src/rxvt': No such
file
make: *** [/opt/BuildRoot/buildroot-2009.08/build_arm/rxvt-2.7.5/src/rxvt]
Fehler 1
 
-- 
View this message in context: http://old.nabble.com/rxvt%3A-build-errors---what-to-do--tp26481849p26481849.html
Sent from the BuildRoot mailing list archive at Nabble.com.
