From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Jun 2012 15:11:41 +0200
Subject: [Buildroot] MIPS target: some packages fail on compilation
In-Reply-To: <CACZwKmvh9yN4Ous6JTDP_SkxkDxNueKQj2eMqzKGmb5gQX3D7g@mail.gmail.com>
References: <CACZwKmuhunVfNwRTZfVMOxhbe0h=-fzjG74rCzLYvraOg6Zvkw@mail.gmail.com>
 <CACZwKmvh9yN4Ous6JTDP_SkxkDxNueKQj2eMqzKGmb5gQX3D7g@mail.gmail.com>
Message-ID: <20120609151141.6908908a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 8 Jun 2012 15:13:11 +0400,
Evgeny Rovinsky <e.rovinsky@gmail.com> a ?crit :

> I'm building a rootfs system for MIPS IV target platform (using the
> crosstool-ng-1.14.1 , n64 ABI with "-O3 -march=7k" flags, the 2.6.37
> kernel. Buildroot version 2012.05-rc3).
> I've got the number of packages that fail on compilation stage. Here is the
> list:
> 
> dmalloc
> lmbench
> pv
> qt (the opensource version)
> sysvinit
> xstroke
> strace
> ltp-testsuite
> directfb
> 
> I had to disable the compilation of all the above packages.

Could you please send your Buildroot .config file so we can reproduce
those problems?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
