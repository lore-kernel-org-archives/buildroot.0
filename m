From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:47:40 +0200
Subject: [Buildroot] [PATCH v2] configs/mx6udoo: Add initial support
In-Reply-To: <1475712677-29772-1-git-send-email-festevam@gmail.com>
References: <1475712677-29772-1-git-send-email-festevam@gmail.com>
Message-ID: <20161009224740.45cd2e5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Oct 2016 21:11:17 -0300, Fabio Estevam wrote:
> Add the initial support for mx6q/dl udoo boards.
> 
> For information about these boards, please visit:
> http://www.udoo.org/
> 
> In linux.fragment we disable USB support for now because kernel 4.8
> hangs on udoo board.
> 
> This is been addressed by Peter Chen's kernel patch series that provides
> a standard way to reset a USB hub.
> 
> When such series hit mainline, then we can bump the kernel and remove
> linux.fragment.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Add BR2_TARGET_UBOOT_FORMAT_IMG=y and remove the unneeded
> BR2_PACKAGE_HOST_UBOOT_TOOLS option

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
