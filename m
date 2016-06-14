From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jun 2016 13:52:46 +0200
Subject: [Buildroot] Clean and rebuild rootfs.ext2 and rootfs.tar
In-Reply-To: <20160614103400.GH2749@tarshish>
References: <CALtfCQYcXvZLsVhNAzZ_wdR=R9-rw72cw7BvNvDM2nSEwAcM1A@mail.gmail.com>
 <20160614103400.GH2749@tarshish>
Message-ID: <20160614135246.1b62f776@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Jun 2016 13:34:00 +0300, Baruch Siach wrote:

> On Tue, Jun 14, 2016 at 11:32:32AM +0200, Oscar Gomez Fuente wrote:
> > Is there any way to clean the files: rootfs.ext2 and rootfs.tar and rebuild
> > them again? I only want to guarantee that my rootfs.ext2 and rootfs.tar are
> > updated. Up to know I was using: make clean && make, but I spend a lot of
> > time.  
> 
> Just deleting these files and running 'make' should do the trick.

You don't even need to delete these files. Just run "make", and all
filesystem images are re-generated at every "make" invocation.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
