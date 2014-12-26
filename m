From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 13:42:41 +0100
Subject: [Buildroot] [PATCH] linux: fix breakage from
 d4b2b032a00c9922c9efa144b014dc086a7e48f1
In-Reply-To: <1419429295-16322-1-git-send-email-gustavo@zacarias.com.ar>
References: <1419429295-16322-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141226134241.774f44a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 24 Dec 2014 10:54:55 -0300, Gustavo Zacarias wrote:
> Unbreak qemu_xtensa_lx60_defconfig where LINUX_IMAGE_NAME !=
> LINUX_TARGET_NAME.
> It incorrectly overwrites LINUX_IMAGE_NAME even if it was set before,
> defeating the purpose of IMAGE being different than TARGET.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  linux/linux.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
