From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Jan 2017 19:55:43 +0100
Subject: [Buildroot] [PATCH] configs: nitrogen*: bump kernel and u-boot
	revisions
In-Reply-To: <20170124164020.23318-1-gary.bisson@boundarydevices.com> (Gary
 Bisson's message of "Tue, 24 Jan 2017 17:40:20 +0100")
References: <20170124164020.23318-1-gary.bisson@boundarydevices.com>
Message-ID: <87lgu0guds.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Here are the main U-Boot modifications:
 > - Fix second Ethernet port for SoloX
 > - Fix LCD disable sequence
 > - Fix LVDS2 as primary display

 > Here are the main Linux modifications:
 > - Rebase on top of NXP 4.1.15_2.0.0 branch
 > - Fix touch screens interrupt conflicts
 > - Backport tw686x features from mainline
 > - Fix multiple ft5x06 touch instantiation
 > - Fix dirty cow vulnerability
 > - Various improvements to TC358743 driver

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 > ---
 > Hi all,

 > Here is the usual revision bump for our platforms which includes
 > a few bug fixes.

Committed, thanks.

-- 
Bye, Peter Korsgaard
