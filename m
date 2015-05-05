From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 22:46:00 +0200
Subject: [Buildroot] [PATCHv2] toolchain/external: better report RPC
 error for custom toolchains
In-Reply-To: <1430667556-12745-1-git-send-email-yann.morin.1998@free.fr>
References: <1430667556-12745-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150505224600.729e81bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  3 May 2015 17:39:16 +0200, Yann E. MORIN wrote:
> Currently, we instruct users to enable/disable BR2_TOOLCHAIN_HAS_NATIVE_RPC
> but that is a blind option. The only option users can set/unset is
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC.
> 
> Use that in the error message.
> 
> Notes: the only way for this message to appear is for a custom external
> toolchain, either downloaded or pre-installed, so even though we check
> the validity of the toolchain with BR2_TOOLCHAIN_HAS_NATIVE_RPC, we do
> report on BR2_TOOLCHAIN_EXTERNAL_INET_RPC.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> ---
> Changes v1 -> v2;
>   - fix typo in commit log  (Arnout)
> ---
>  toolchain/helpers.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
