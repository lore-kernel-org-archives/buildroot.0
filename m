From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 22:19:27 +0200
Subject: [Buildroot] [PATCH v2] Config.in: add -Ofast option
In-Reply-To: <1522092845-9842-1-git-send-email-joshua.henderson@microchip.com>
References: <1522092845-9842-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180326221927.010a477c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Mar 2018 12:34:05 -0700, Joshua Henderson wrote:
> -Ofast (introduced in GCC 4.6) It combines the existing optimization level -O3
> with options that can affect standards compliance but result in better optimized
> code. For example, -Ofast enables -ffast-math.
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> 
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
