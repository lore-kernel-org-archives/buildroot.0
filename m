From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 16:38:09 +0200
Subject: [Buildroot] [PATCH 3/3] configs: pandaboard: bump kernel to 4.5
In-Reply-To: <1458077996-15549-3-git-send-email-peter@korsgaard.com>
References: <1458077996-15549-1-git-send-email-peter@korsgaard.com>
 <1458077996-15549-3-git-send-email-peter@korsgaard.com>
Message-ID: <20190726163809.3301a3ee@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tue, 15 Mar 2016 22:39:56 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Notice: We cannot move to u-boot 2016.03 without changing the boot setup as
> 2016.03 broke legacy boot on omap4.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

You are the last one who bumped this defconfig, and now it fails to
build with gcc 8.x:

https://gitlab.com/buildroot.org/buildroot/-/jobs/259853955

Probably needs another update of the kernel :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
