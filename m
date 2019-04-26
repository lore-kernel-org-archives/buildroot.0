From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:44:13 +0200
Subject: [Buildroot] [git commit]
 configs/atmel_sama5d4_xplained_mmc_dev: increase ext4 image size
In-Reply-To: <20190421142159.CFFD47F8CE@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 21 Apr 2019 15:27:28 +0200")
References: <20190421142159.CFFD47F8CE@busybox.osuosl.org>
Message-ID: <87sgu5ym02.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=18a4d559061ab3d00f7e39c963d86ee5ff794d4c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The default of 60 MB is no longer sufficient to contain all the tools
 > enabled in this "development" defconfig, so let's increase the ext4
 > image size to 120 MB.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/199339426

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
