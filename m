From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 16:38:59 +0100
Subject: [Buildroot] [PATCH v4 2/2] package/utp_com: new host package
In-Reply-To: <1549285823-41193-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1549285823-41193-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1549285823-41193-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20190204163859.134917a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Feb 2019 07:10:23 -0600
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Vincent Prince <vincent.prince.fr@gmail.com>
> 
> This tool is used to send commands to imx6 based hardware using NXP's
> UTP protocol.
> 
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> 
> (Vincent, I'd suggest sending a follow on patch to add yourself as a
> DEVELOPER to maintain this package)

Actually, when adding a new package, having an entry in the DEVELOPERS
file is mandatory, so I've added one.

> +define HOST_UTP_COM_INSTALL_CMDS
> +	$(INSTALL) -m 755 $(@D)/utp_com $(HOST_DIR)/bin/utp_com

Missing -D option (just in case).

Applied with those two nits fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
