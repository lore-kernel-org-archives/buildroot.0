From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 15 Nov 2019 17:28:33 +0100
Subject: [Buildroot] lshw package not getting added to the resulting
 image
In-Reply-To: <1573794819086-0.post@n4.nabble.com>
References: <1573645315718-0.post@n4.nabble.com>
 <20191113215806.45bb1ec7@gmx.net>
 <1573716587196-0.post@n4.nabble.com>
 <20191114202532.7bdd338b@gmx.net>
 <1573794819086-0.post@n4.nabble.com>
Message-ID: <20191115172833.7fabae3a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Nov 2019 23:13:39 -0600 (CST), a <anushka.parashar@tesco.com> wrote:

> Hi!
>
> I'm using buildroot-2019.02.6
>
> PFA .config file and build.log
>
> *.config file* is the file before I set BR2_PACKAGE_LSHW=y, and
>
> *build.log file* is the log after I set BR2_PACKAGE_LSHW=y and now it's

Sorry, no config/build.log files attached to the e-mail...

Regards,
Peter

> showing the following error while building lshw B.02.18 package:
> make[1]:
> /root/buildroot-hello/output/host/bin/x86_64-buildroot-linux-uclibc-g++:
> Command not found
> make[1]: *** [lshw.o] Error 127
> make[1]: *** Waiting for unfinished jobs....
> make[2]: Entering directory
> `/root/buildroot-hello/output/build/lshw-B.02.18/src/core'
> /root/buildroot-hello/output/host/bin/x86_64-buildroot-linux-uclibc-g++ -g
> -Wall -g -I./core/ -DPREFIX=\"/usr\" -DSBINDIR=\"/usr/sbin\"
> -DMANDIR=\"/usr/share/man\" -DDATADIR=\"/usr/share\" -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c hw.cc -o hw.o
> make[2]:
> /root/buildroot-hello/output/host/bin/x86_64-buildroot-linux-uclibc-g++:
> Command not found
> make[2]: *** [hw.o] Error 127
> make[2]: Leaving directory
> `/root/buildroot-hello/output/build/lshw-B.02.18/src/core'
> make[1]: *** [core] Error 2
> make[1]: Leaving directory
> `/root/buildroot-hello/output/build/lshw-B.02.18/src'
> make: *** [/root/buildroot-hello/output/build/lshw-B.02.18/.stamp_built]
> Error 2
>
>
>
>
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
