From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jul 2012 11:41:55 +0200
Subject: [Buildroot] Systemd update
In-Reply-To: <CA+wH294OCgYwtavEVYFUaDv1zpPPcXxEc8nDr4K_fkh2ydo9gw@mail.gmail.com>
References: <CADiAo4KdxANfaB4xZyWBZe_w+y-p9UTJ1FVjcX7=KgRHkinVHQ@mail.gmail.com>
 <CALR4fEKHpNy-TyCBWigS-9gLySp_d3Amy_N=xZqSWbif-9H97A@mail.gmail.com>
 <CADiAo4KwLhtG-ZpaBBSRQAeDBjKW9XCxAm00ZHUKw2NF97dEMg@mail.gmail.com>
 <CALR4fE+nyZZXCGVOSRJM=rir4eYE4L0_Y7K+KZE5wvmUL8dFTA@mail.gmail.com>
 <CA+wH294OCgYwtavEVYFUaDv1zpPPcXxEc8nDr4K_fkh2ydo9gw@mail.gmail.com>
Message-ID: <20120716114155.3b5f715f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Jul 2012 10:32:43 +0100,
Alex Bradbury <asb@asbradbury.org> a ?crit :

> I'm interested in buildroot + the Raspberry Pi also (I'm currently
> responsible for the official Debian wheezy based images). You might
> want to have a look at
> https://github.com/nezticle/RaspberryPi-BuildRoot and feel free to
> contact me off-list if you're having problems building and booting a
> kernel (or drop by #raspberrypi-dev on Freenode).

Do you think it would be possible to submit the necessary patches to
the official Buildroot, instead of maintaining a fork? It will also
make it easier for you to maintain the support for Rasberry Pi if it is
in the mainline Buildroot version.

I am definitely interested in seeing more board/SoC-specific support in
Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
