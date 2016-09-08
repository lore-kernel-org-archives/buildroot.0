From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 22:28:07 +0200
Subject: [Buildroot] [PATCH v3] configs: Add support for warp7 board
In-Reply-To: <1473351149-20025-1-git-send-email-fabio.estevam@nxp.com>
References: <1473351149-20025-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20160908222807.254da1c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Sep 2016 13:12:29 -0300, Fabio Estevam wrote:
> Add support for warp7, which is a board based on NXP i.MX7S processor.
> 
> More information about warp7 can be found at:
> https://www.element14.com/community/docs/DOC-79058
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

I've applied, after doing a small change, see below.


> +Create a bootable eMMC image
> +============================

This section does not document how to create a bootable eMMC image
(it's done by Buildroot), but rather how to flash it. So I've adjusted
the title of this section accordingly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
