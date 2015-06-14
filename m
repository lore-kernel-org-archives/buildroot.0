From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:29:37 +0200
Subject: [Buildroot] [PATCH 1/1] fs/romfs: add U-Boot image support
In-Reply-To: <1433782196-17824-1-git-send-email-hoang.tran@vnoss.org>
References: <1433782196-17824-1-git-send-email-hoang.tran@vnoss.org>
Message-ID: <20150614232937.6805b496@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hoang Tran,

On Mon,  8 Jun 2015 09:49:56 -0700, Hoang Tran wrote:
> Adds U-Boot image support for romfs root filesystems. This allows you to
> use the bootm command in U-Boot to load the rootfs.
> 
> Signed-off-by: Hoang Tran <hoang.tran@vnoss.org>
> ---
>  fs/romfs/Config.in | 13 +++++++++++++
>  fs/romfs/romfs.mk  | 10 +++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)

Considering the absence of reaction to Arnout's comment about your
patch, I've marked it as 'Rejected' in our patch tracking system. Of
course, if you believe the patch is still useful despite Arnout
comment, do not hesitate to resend an updated version with an extended
justification.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
