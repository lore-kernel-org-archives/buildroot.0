From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 22:52:00 +0200
Subject: [Buildroot] [PATCH v3 1/2] arch: tidy up mmu config
In-Reply-To: <1433370844-11584-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1433340749-7711-1-git-send-email-guido@vanguardiasur.com.ar>
 <1433370844-11584-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150609225200.1b9bb712@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Wed,  3 Jun 2015 19:34:03 -0300, Guido Mart?nez wrote:
> Instead of blacklisting which architectures support MMUs (mandatorily
> or optionally), introduce two Kconfig options that are selected by each
> architecture in each case.
> 
> This simplifies the logic in BR2_USE_MMU.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  arch/Config.in                | 28 ++++++++++++++++++++++++++++
>  arch/Config.in.arm            | 17 +++++++++++++++++
>  arch/Config.in.xtensa         |  2 ++
>  toolchain/toolchain-common.in |  4 ++--
>  4 files changed, 49 insertions(+), 2 deletions(-)

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
