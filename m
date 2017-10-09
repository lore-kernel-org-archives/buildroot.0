From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Oct 2017 20:59:11 +0200
Subject: [Buildroot] [PATCH] configs/imx6-sabresd: Add VPU decoding
 support
In-Reply-To: <1507571432-18190-1-git-send-email-fabio.estevam@nxp.com>
References: <1507571432-18190-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20171009205911.6198f95a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 9 Oct 2017 14:50:32 -0300, Fabio Estevam wrote:
> Mainline kernel is able to decode video via the coda driver.
> 
> Add support for it.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Perhaps it would be good to document in the board readme.txt file a few
commands to test the VPU support?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
