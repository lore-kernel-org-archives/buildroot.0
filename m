From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:39:03 +0200
Subject: [Buildroot] [PATCH] core/out-of-tree: fix Makefile wrapper
In-Reply-To: <1437081406-16475-1-git-send-email-yann.morin.1998@free.fr>
References: <1437081406-16475-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150716233903.4e2d98a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 16 Jul 2015 23:16:46 +0200, Yann E. MORIN wrote:
> Commit 971faf8 (Makefile: fix out-of-tree builds with multiple targets
> with 'all') renamed the default target to '_all' to avoid name-clashing.
> 
> In doing so, I forgot to also fix the instance in the .PHONY rule.
> 
> Fix that now.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/scripts/mkmakefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
