From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 13:59:25 +0100
Subject: [Buildroot] [PATCH 2/3] boot/at91bootstrap3: add hash for
 3.8.10 version
In-Reply-To: <1576500357-21964-2-git-send-email-eugen.hristev@microchip.com>
References: <1576500357-21964-1-git-send-email-eugen.hristev@microchip.com>
 <1576500357-21964-2-git-send-email-eugen.hristev@microchip.com>
Message-ID: <20191216135925.022c6cd4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Dec 2019 12:46:22 +0000
<Eugen.Hristev@microchip.com> wrote:

> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> 3.8.10 is still used by some boards. It needs a hash to cope with
> the custom tarball download system.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

No, for the custom tarball case, we want to do:

BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
