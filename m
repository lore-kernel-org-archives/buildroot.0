From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Oct 2016 19:56:50 +0200
Subject: [Buildroot] [PATCH 1/2] imx28evk: Fix the first partition
	location
In-Reply-To: <1477412500-18757-1-git-send-email-fabio.estevam@nxp.com> (Fabio
 Estevam's message of "Tue, 25 Oct 2016 14:21:39 -0200")
References: <1477412500-18757-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <87r374jorh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <fabio.estevam@nxp.com> writes:

 > When the SD card is connected to the host PC it can be mount as
 > /dev/mmcblk0.

 > In this case the first partition is /dev/mmcblk0p1, not /dev/mmcblk01.

 > So use the ${PART1} variable to correctly assign this location.

 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
