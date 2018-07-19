From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 09:59:19 +0200
Subject: [Buildroot] [PATCH 3/5] board/boundarydevices: remove obsolete
 u-boot scripts
In-Reply-To: <20180719073253.22433-4-gary.bisson@boundarydevices.com>
References: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
 <20180719073253.22433-4-gary.bisson@boundarydevices.com>
Message-ID: <20180719095919.63f6fa07@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 09:32:51 +0200, Gary Bisson wrote:
> - 6x_bootscript/6x_upgrade have been deprecated for more than a year
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

As mentioned in the review of PATCH 2/5, this should be together with
the patch that drops the use of those obsolete scripts from
post-build.sh.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
