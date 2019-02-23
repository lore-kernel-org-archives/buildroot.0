From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 15:54:37 +0100
Subject: [Buildroot] [PATCH 2/2] package/rpi-firmware: bump version to
 83977fe3b6
In-Reply-To: <20190223152711.6caac341@gmx.net>
References: <20190222223704.6202-1-ps.report@gmx.net>
 <20190222223704.6202-2-ps.report@gmx.net>
 <20190223143753.59fcb120@windsurf.home>
 <20190223152711.6caac341@gmx.net>
Message-ID: <20190223155437.0988855f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thanks for your feedback!

On Sat, 23 Feb 2019 15:27:11 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> > What is the reason for bumping to 83977fe3b6 in master ? And then to
> > ebf7b40cdc in next ?  
> 
> Sorry for the confusion, preparing the bump (maybe buildroot-master) to 
> 
>  - kernel 877656cd14 (4.14.98, up-to-date one from the 4.14 branch)
>  - firmware 83977fe3b6, last commit before [1]:
>  
> 	kernel bump to 4.19.23
> 
> 	See: https://www.raspberrypi.org/forums/viewtopic.php?f=29&t=224931

What are the firmware changes between what's currently in master and
83977fe3b6 ? Does it make sense to apply this to master ?

> overlapped with the release of 4.19.23 [3] and the follow up bump (major kernel
> update for buildroot-next) to
> 
>   - kernel 5eeff139ea (4.19.23)
>   - firmware ebf7b40cdc [2], one commit after [1],

So the firmware version ebf7b40cdc is needed to boot a 4.19 kernel ? Is
it backward compatible with the 4.14 kernel ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
