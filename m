From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 23:16:08 +0200
Subject: [Buildroot] [PATCH 5/5] toolchain-external: unify
 LIB_EXTERNAL_LIBS and USR_LIB_EXTERNAL_LIBS
In-Reply-To: <1455304826-10557-6-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <1455304826-10557-6-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160425231608.1a7000be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Feb 2016 20:20:26 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> With the alignment of toolchain library location in target and staging,
> there is no need anymore for the distinction between LIB_EXTERNAL_LIBS and
> USR_LIB_EXTERNAL_LIBS. Unify them into TOOLCHAIN_EXTERNAL_LIBS.
> 
> Related, update the help text of
> BR2_TOOLCHAIN_EXTRA_TOOLCHAIN_EXTERNAL_LIBS.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  toolchain/toolchain-external/Config.in             |  3 +--
>  toolchain/toolchain-external/toolchain-external.mk | 22 +++++++++++-----------
>  2 files changed, 12 insertions(+), 13 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
