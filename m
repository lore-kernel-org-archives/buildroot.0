From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Mar 2014 19:46:55 +0100
Subject: [Buildroot] [PATCH] toolchain/wrapper: rename BR_DEBUG_WRAPPER
In-Reply-To: <1393887305-2252-1-git-send-email-yann.morin.1998@free.fr>
References: <1393887305-2252-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140305194655.07901a7d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  3 Mar 2014 23:55:05 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The user-facing variables should be prefixed with BR2_, not BR_.
> 
> Also quote the variable in the manual.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/customize-toolchain.txt                  | 2 +-
>  toolchain/toolchain-external/ext-toolchain-wrapper.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
