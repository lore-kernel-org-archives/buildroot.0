From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 23 Feb 2019 15:27:11 +0100
Subject: [Buildroot] [PATCH 2/2] package/rpi-firmware: bump version to
 83977fe3b6
In-Reply-To: <20190223143753.59fcb120@windsurf.home>
References: <20190222223704.6202-1-ps.report@gmx.net>
 <20190222223704.6202-2-ps.report@gmx.net>
 <20190223143753.59fcb120@windsurf.home>
Message-ID: <20190223152711.6caac341@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 23 Feb 2019 14:37:53 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri, 22 Feb 2019 23:37:04 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> What is the reason for bumping to 83977fe3b6 in master ? And then to
> ebf7b40cdc in next ?

Sorry for the confusion, preparing the bump (maybe buildroot-master) to 

 - kernel 877656cd14 (4.14.98, up-to-date one from the 4.14 branch)
 - firmware 83977fe3b6, last commit before [1]:
 
	kernel bump to 4.19.23

	See: https://www.raspberrypi.org/forums/viewtopic.php?f=29&t=224931

overlapped with the release of 4.19.23 [3] and the follow up bump (major kernel
update for buildroot-next) to

  - kernel 5eeff139ea (4.19.23)
  - firmware ebf7b40cdc [2], one commit after [1],

Regards,
Peter

[1] https://github.com/raspberrypi/firmware/commit/d095b96ac33de9eb4b95539cb3261f35a3c74509
[2] https://github.com/raspberrypi/firmware/commit/ebf7b40cdc6effe7ffa3fd5195e8be01b94f80da
[3] https://www.phoronix.com/scan.php?page=news_item&px=Raspberry-Pi-Linux-4.19-Rolling

> 
> Thomas
