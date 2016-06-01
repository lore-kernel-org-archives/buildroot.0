From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 17:07:00 +0200
Subject: [Buildroot] [PATCH next 0/4] uboot-tools: fix support for Flat
 Image Trees (FIT).
In-Reply-To: <1464791982-10166-1-git-send-email-casantos@datacom.ind.br>
References: <1462736800-9552-1-git-send-email-casantos@datacom.ind.br>
 <1464791982-10166-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20160601170700.45e96433@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Jun 2016 11:39:38 -0300, Carlos Santos wrote:
> The current package is partially broken due to a bug in Das U-Boot. FIT
> support is always built but requires the "dtc" utility, which is not
> available because uboot-tools does not depend on it. Additionally, the
> BR2_STRIP_xxxx setup is ignored and the utilities are always stripped.
> 
> This series fixes the bugs and introduces a more fine-grained selection
> of features for both host and target packages,
> 
> Carlos Santos (4):
>   uboot-tools: use $(TARGET_STRIP) for target utilities
>   uboot-tools: improve the help text of existing options
>   uboot-tools: re-generate patches to match v2016.05

Patches 1 to 3 applied.

>   uboot-tools: fix FIT support and make it optional

I need a bit of time to review that one.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
