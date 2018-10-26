From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 21:27:51 +0200
Subject: [Buildroot] [PATCH 1/3] uboot: replace mkimage invocation with
 MKIMAGE
In-Reply-To: <1540348893-3286-1-git-send-email-danomimanchego123@gmail.com>
References: <1540348893-3286-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20181026212751.4bab8bb4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Oct 2018 22:41:33 -0400, Danomi Manchego wrote:
> We already use $(MKIMAGE) instead of $(HOST_DIR)/bin/mkimage in xvisor, linux,
> and cpio; use it here too.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
