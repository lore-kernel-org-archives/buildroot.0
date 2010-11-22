From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Nov 2010 19:47:26 +0100
Subject: [Buildroot] [PATCH 3/4] Create menu entry to select device
 creation method
In-Reply-To: <4CA48951.60903@visionsystems.de>
References: <4C9C54A9.20803@visionsystems.de>
	<4C9C54FC.4040609@visionsystems.de>
	<4C9C553E.8040105@visionsystems.de>
	<4C9C558A.7050009@visionsystems.de> <20100928193508.41e6b8ae@surf>
	<4CA32E7B.4000506@visionsystems.de>
	<4CA48951.60903@visionsystems.de>
Message-ID: <20101122194726.4dc3d810@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 Sep 2010 14:57:53 +0200
Yegor Yefremov <yegor_sub1@visionsystems.de> wrote:

> Create menu entry to select device creation method:
> 
> - static method uses device table as before
> - devtmpfs method enables this feature in kernel
> - mdev method adds mdev starting script to the file system
>   and selects mdev itself for installation
> - udev method selects udev for installation 
> 
> All dynamic methods are base on devtmpfs, so one doesn't
> need to care about /dev folder.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks, merged into my for-2011.02/boards-cleanup branch.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
