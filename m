From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:23:41 +0100
Subject: [Buildroot] [PATCH 10/14] boot/uboot/uboot.mk: Strip quotes
 from BR2_TARGET_UBOOT_SPL_NAME
In-Reply-To: <1418426171-3483-11-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
 <1418426171-3483-11-git-send-email-jkrause@posteo.de>
Message-ID: <20141221232341.3e8216f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 13 Dec 2014 00:16:07 +0100, J?rg Krause wrote:
> Remove the quotes from the BR2_TARGET_UBOOT_SPL_NAME variable.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
