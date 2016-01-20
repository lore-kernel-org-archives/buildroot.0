From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 23:03:03 +0100
Subject: [Buildroot] [PATCH] core: override the user's locale while
 setting HOSTARCH
In-Reply-To: <1453326799-14060-1-git-send-email-romain.naour@gmail.com>
References: <1453326799-14060-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160120230303.75714349@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 20 Jan 2016 22:53:19 +0100, Romain Naour wrote:
> At least with French user's locale HOSTARCH is empty since
> 'Target' is not present in gcc output.
> 
> gcc -v 2>&1
> Utilisation des specs internes.
> COLLECT_GCC=gcc
> COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-redhat-linux/5.3.1/lto-wrapper
> Cible : x86_64-redhat-linux
> 
> Override the user's local with LC_ALL=C.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
