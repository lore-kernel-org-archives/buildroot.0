From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Feb 2017 11:57:35 +0100
Subject: [Buildroot] [PATCH] package/libepoxy: needs host-pkgconf
In-Reply-To: <1487929206-9186-1-git-send-email-yann.morin.1998@free.fr>
References: <1487929206-9186-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170224115735.655e1f59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Feb 2017 10:40:06 +0100, Yann E. MORIN wrote:
> configure.ac uses PKG_CHECK_MODULES() so it needs host-pkgconf.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libepoxy/libepoxy.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
