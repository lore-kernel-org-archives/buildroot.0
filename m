From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Mar 2018 21:18:59 +0100
Subject: [Buildroot] [PATCH v5 1/4] imx-mkimage: new package
In-Reply-To: <1520448738-5794-2-git-send-email-karl.erik.larsson@gmail.com>
References: <1520448738-5794-1-git-send-email-karl.erik.larsson@gmail.com>
 <1520448738-5794-2-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180307211859.60ebace3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Mar 2018 19:52:15 +0100, Erik Larsson wrote:
> This package add support for imx-mkimage for iMX8M.
> Currently the only hardware it's tested for.
> 
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>

For the record, I already expressed my dislike of this host package
depending on uboot, linux, and generating images in BINARIES_DIR, and I
still dislike this approach.

So I am not in favor of applying this patch as it is proposed today.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
