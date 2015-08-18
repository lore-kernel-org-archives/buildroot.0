From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 21:43:01 +0200
Subject: [Buildroot] [PATCH v2] fs: iso9660: change boot menu entry text
In-Reply-To: <1439328230-17550-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1439328230-17550-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20150818214301.7ab37102@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vivien Didelot,

On Tue, 11 Aug 2015 17:23:50 -0400, Vivien Didelot wrote:
> Replace Grub-specific "menu.lst" with "menu config" in the
> BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU Kconfig entry text, and mention
> missing grub.cfg for Grub 2.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  fs/iso9660/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
