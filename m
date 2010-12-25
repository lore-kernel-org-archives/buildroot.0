From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Dec 2010 12:18:03 +0100
Subject: [Buildroot] [PATCH] v2 Add UBI image generation support.
In-Reply-To: <1292953087-19486-1-git-send-email-julien.boibessot@free.fr>
References: <1292953087-19486-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20101225121803.16bc81c6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Dec 2010 18:38:07 +0100
julien.boibessot at free.fr wrote:

> From: Julien Boibessot <julien.boibessot@armadeus.com>
> 
> UBI images are generated from UBIFS one (with ubinize tool) and are used by
> bootloaders (eg U-Boot) to write UBIFS images directly on bare NAND FLASH
> (see http://www.linux-mtd.infradead.org/faq/ubi.html).
> 
> Changes since v1:
> * change some comments/helps
> * as requested by Thomas, merged fs/ubi/ in fs/ubifs/, but kept ubifs.mk and
>   ubi.mk separated. (I don't know if it's really worth to merge them...)
> 
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> Signed-off-by: Nicolas Colombain <nicolas.colombain@armadeus.com>

After thinking about this a bit, I think having two separate images is
better, as it is more clear for the user what the image actually is.
Therefore, I think this version from Julien should be applied, and it
gets my:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
