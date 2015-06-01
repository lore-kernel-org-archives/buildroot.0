From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 01 Jun 2015 13:59:17 -0300
Subject: [Buildroot] [PATCH 1/2] arch: tidy up mmu config
In-Reply-To: <1432227249-15345-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1432227249-15345-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <556C8F65.4000809@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Romain:

On 05/21/2015 01:54 PM, Guido Mart?nez wrote:
> Instead of blacklisting which architectures support MMUs (mandatorily
> or optionally), introduce two Kconfig options that are selected by each
> architecture in each case.
> 
> This simplifies the logic in BR2_USE_MMU.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  arch/Config.in                | 26 ++++++++++++++++++++++++++
>  arch/Config.in.arm            | 17 +++++++++++++++++
>  toolchain/toolchain-common.in |  4 ++--
>  3 files changed, 45 insertions(+), 2 deletions(-)
> 

Any news about this and the next one?

We'd really like to move forward with the cortex-M support. (BTW, Linux
v4.2 will probably carry a good amount of support for LPC43xx.)

Thanks!
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
