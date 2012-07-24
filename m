From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 08:58:53 +0200
Subject: [Buildroot] [PATCH 2/2] New package: cpuload (Updated)
In-Reply-To: <CAJhJPsWzOPq_M=XqQuiuXnJLybnD4r3JCsfw8pO8y=G1txCesQ@mail.gmail.com>
References: <1342764221-16660-1-git-send-email-keguang.zhang@gmail.com>
 <CAJhJPsWzOPq_M=XqQuiuXnJLybnD4r3JCsfw8pO8y=G1txCesQ@mail.gmail.com>
Message-ID: <20120724085853.03429284@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kelvin,

Le Tue, 24 Jul 2012 14:45:18 +0800,
Kelvin Cheung <keguang.zhang@gmail.com> a ?crit :

> What about this package?
> I had updated cpuload to version 0.3 to remove unnecessary
> wide-character string code.

It is still on my list of patches pending for merging. However, I have
merged a number of package updates and toolchain changes recently, and
the results of the autobuilders have degraded in quality, see
http://autobuild.buildroot.org/. I'd like to fix those new build issues
before accepting too many new packages.

In other words: if you want your package to be added quickly, please
send patches to fix the build issues first :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
