From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 15 Nov 2019 14:01:46 -0300
Subject: [Buildroot] lshw package not getting added to the resulting
 image
In-Reply-To: <20191115172833.7fabae3a@gmx.net>
References: <1573645315718-0.post@n4.nabble.com>
 <20191113215806.45bb1ec7@gmx.net>
 <1573716587196-0.post@n4.nabble.com> <20191114202532.7bdd338b@gmx.net>
 <1573794819086-0.post@n4.nabble.com> <20191115172833.7fabae3a@gmx.net>
Message-ID: <CAJ4jsac-kgESqTrKdp7KG9sgGksH+ZCTU4vrOFacwT24mdGr-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 15, 2019 at 1:29 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello,
>
> On Thu, 14 Nov 2019 23:13:39 -0600 (CST), a <anushka.parashar@tesco.com> wrote:
>
> > Hi!
> >
> > I'm using buildroot-2019.02.6
> >
> > PFA .config file and build.log
> >
> > *.config file* is the file before I set BR2_PACKAGE_LSHW=y, and
> >
> > *build.log file* is the log after I set BR2_PACKAGE_LSHW=y and now it's
>
> Sorry, no config/build.log files attached to the e-mail...
>
> Regards,
> Peter
>
> > showing the following error while building lshw B.02.18 package:
> > make[1]:
> > /root/buildroot-hello/output/host/bin/x86_64-buildroot-linux-uclibc-g++:
> > Command not found
> > make[1]: *** [lshw.o] Error 127
> > make[1]: *** Waiting for unfinished jobs....
> > make[2]: Entering directory
> > `/root/buildroot-hello/output/build/lshw-B.02.18/src/core'
> > /root/buildroot-hello/output/host/bin/x86_64-buildroot-linux-uclibc-g++ -g
> > -Wall -g -I./core/ -DPREFIX=\"/usr\" -DSBINDIR=\"/usr/sbin\"
> > -DMANDIR=\"/usr/share/man\" -DDATADIR=\"/usr/share\" -D_LARGEFILE_SOURCE
> > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c hw.cc -o hw.o
> > make[2]:
> > /root/buildroot-hello/output/host/bin/x86_64-buildroot-linux-uclibc-g++:
> > Command not found

Your toolchain does not have C++

-- 
Carlos Santos <unixmania@gmail.com>
