From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 11 Aug 2015 09:26:26 +0200
Subject: [Buildroot] [PATCH] fs: cpio: uImage depends on U-Boot
In-Reply-To: <1439237106-18033-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1439237106-18033-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <55C9A3A2.5040300@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2015 22:05, Vivien Didelot wrote:
> Even though some bootloaders such as Barebox can boot uImage, this
> format is quite U-Boot specific. So make BR2_TARGET_ROOTFS_CPIO_UIMAGE
> depends on BR2_TARGET_UBOOT.

What if you already have a U-Boot binary compiled by your board vendor ?
