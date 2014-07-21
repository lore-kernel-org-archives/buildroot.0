From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:51:35 +0200
Subject: [Buildroot] [PATCH] php-memcached: make zlib directory explicit
In-Reply-To: <1405942773-26816-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405942773-26816-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140721215135.78801b27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 21 Jul 2014 08:39:33 -0300, Gustavo Zacarias wrote:
> Otherwise it fails to find in some cases. Fixes:
> http://autobuild.buildroot.net/results/993/99342e74d0866a7acddbf9da66aafbfa4f3c12f1/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/php-memcached/php-memcached.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
