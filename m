From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 08:51:31 +0100
Subject: [Buildroot] [PATCH 1/1] configs/bananapi_m1_plus_defconfig: new
 defconfig
In-Reply-To: <4f49c391-6275-cf49-6751-921f7484aa99@gmail.com>
References: <20210120172815.3395049-1-fskoneczny@gmail.com>
 <20210123214036.720c3a3f@windsurf.home>
 <4f49c391-6275-cf49-6751-921f7484aa99@gmail.com>
Message-ID: <20210125085131.3829173f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Filip,

On Sun, 24 Jan 2021 18:50:45 +0100
Filip <fskoneczny@gmail.com> wrote:

> >> +BR2_TARGET_GENERIC_HOSTNAME="bananapi"
> >> +BR2_TARGET_GENERIC_ISSUE="Welcome to Banana Pi!"
> >> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y  
> > 
> > Is this needed for automatic loading of modules ?  
> 
> Yes, it was loading brcmfmac automatically, I'm not sure though if this is desired in defconfig.
> After comparing to other configs I decided to remove it and add "modprobe brcmfmac" to readme.txt in proper section instead.
> Let me know if it's OK, or better to leave it to load automatically or something else.

I'd say let's keep mdev then, it's nice if the module gets loaded
automatically.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
