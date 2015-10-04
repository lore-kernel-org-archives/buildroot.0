From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 09:15:57 +0100
Subject: [Buildroot] [PATCH 1/7] configs: remove gnublin_defconfig
In-Reply-To: <20151003230604.069b6d2a@gmx.net>
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1443901457-7914-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20151003230604.069b6d2a@gmx.net>
Message-ID: <20151004091557.30158dd4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 3 Oct 2015 23:06:04 +0200, Peter Seiderer wrote:
> Hello Thomas,
> 
> On Sat,  3 Oct 2015 20:44:11 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> > This defconfig tries to fetch its kernel source code and U-Boot source
> > code from gitorious.org, which is not longer available. Therefore,
> > this defconfig has been failing to build since quite some time. Since
> > there's no obvious other place to grab the kernel and u-boot source
> > code, and the defconfig was not updated since a long time, let's
> > simply get rid of it.
> 
> Just for the record, there are still (old?) sources for kernel/u-boot:
> 
> https://github.com/embeddedprojects/gnublin-lpc3131-2.6.33
> https://github.com/embeddedprojects/gnublin-lpc3131-3.3.0
> https://github.com/embeddedprojects/gnublin-distribution/tree/master/lpc3131/bootloader/u-boot
> 
> but nothing with a 3.7 or newer version...

Yes, I also saw those sources, but since they were older than the 3.7
kernel used in the defconfig and couldn't find any other recent
version, I decided to drop the defconfig entirely.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
