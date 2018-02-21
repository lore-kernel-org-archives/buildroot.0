From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 22:13:16 +0100
Subject: [Buildroot] [PATCH 1/2] pkgconf: pkg-config.in: double quote $@
In-Reply-To: <20180221205555.2728-1-gael.portay@savoirfairelinux.com>
References: <20180221205555.2728-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180221221316.5ff3a77a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Feb 2018 15:55:54 -0500, Ga?l PORTAY wrote:
> Double quote $@ to prevent from splitting elements.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Could you give more details about what this is fixing, i.e a specific
scenario that is fixed by this patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
