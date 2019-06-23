From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 19:14:31 +0200
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: fix license
 hash
In-Reply-To: <20190609132127.GC13603@scaer>
References: <20190603224039.98733-1-aduskett@gmail.com>
 <629a1777-181a-2947-8326-918258ce35c0@mind.be>
 <20190609132127.GC13603@scaer>
Message-ID: <20190623191431.45640019@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 9 Jun 2019 15:21:27 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

>     ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
>     ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
>     ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.txt  # Valid for v1.4
>     endif

I agree with this.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
