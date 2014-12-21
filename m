From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:23:24 +0100
Subject: [Buildroot] [PATCH 08/14] boot/uboot/Config.in: Fix
 BR2_TARGET_UBOOT_SPL
In-Reply-To: <1418426171-3483-9-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
 <1418426171-3483-9-git-send-email-jkrause@posteo.de>
Message-ID: <20141221232324.61eb5bca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 13 Dec 2014 00:16:05 +0100, J?rg Krause wrote:
> Building an SPL image depends on the board configuration. This option
> does not enable the SPL build, but only copies the built SPL image to
> the binary images folder. The current help text is misleading.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  boot/uboot/Config.in | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
