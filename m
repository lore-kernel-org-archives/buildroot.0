From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Jun 2019 18:51:10 +0200
Subject: [Buildroot] [PATCH 21/27] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_90620
In-Reply-To: <a74261b8-c5b7-86a5-4a56-479247f92da4@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-22-giulio.benetti@micronovasrl.com>
 <20190620181408.308b4443@windsurf>
 <a74261b8-c5b7-86a5-4a56-479247f92da4@micronovasrl.com>
Message-ID: <20190621185110.1fe1f814@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jun 2019 11:22:00 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> >> Originally reported for gpsd:  
> 
> I've just realized that is not originally reported for gpsd and...
> 
> >> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
> >>
> >> Fixed on Gcc 8.x but regressed in Gcc 9.x.  
> 
> I've messed up with all these patches, since there is a patch that fixes
> this patch:
> https://patchwork.ozlabs.org/patch/1117724/
> 
> Sorry, but they were a lot of patches and I missed to squash them into 
> only one.

OK, no worries. Considering the amount of patches and different gcc
bugs/situations, I can certainly understand that the patch series will
need some adjustments/fixes once applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
