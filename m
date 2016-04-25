From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 23:00:09 +0200
Subject: [Buildroot] [PATCH 1/5] toolchain-external: blackfin: install
 FDPIC libraries also to staging
In-Reply-To: <1455304826-10557-2-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <1455304826-10557-2-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160425230009.1b2bff10@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Feb 2016 20:20:22 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> For external Blackfin toolchains with BR2_BFIN_INSTALL_FDPIC_SHARED set,
> the FDPIC shared libraries are currently only copied to the target
> directory, not to staging.
> 
> For debugging purposes, an unstripped copy in staging is necessary.
> Moreover, this change will simplify a subsequent change that lines up the
> location of shared libraries between target and staging directories.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
