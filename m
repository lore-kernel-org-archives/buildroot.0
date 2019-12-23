From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 23:45:25 +0100
Subject: [Buildroot] [PATCH v2 2/2] boot/at91bootstrap3: implement
 custom tarball
In-Reply-To: <1576508766-25676-2-git-send-email-eugen.hristev@microchip.com>
References: <1576508766-25676-1-git-send-email-eugen.hristev@microchip.com>
 <1576508766-25676-2-git-send-email-eugen.hristev@microchip.com>
Message-ID: <20191223234525.107c5389@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Dec 2019 15:06:34 +0000
<Eugen.Hristev@microchip.com> wrote:

> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Implement possibility to take AT91Bootstrap as a custom tarball.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v2:
> - use BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
