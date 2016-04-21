From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 23:30:37 +0200
Subject: [Buildroot] [PATCH 2/5] toolchain-external: remove unused
 calculation of ARCH_SUBDIR
In-Reply-To: <1455304826-10557-3-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <1455304826-10557-3-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160421233037.1f80d954@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Feb 2016 20:20:23 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> In TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS, ARCH_SUBDIR is calculated but not
> used, and can thus be removed. Since SYSROOT_DIR is only used for the
> calculation of ARCH_SUBDIR, it can be removed too.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
