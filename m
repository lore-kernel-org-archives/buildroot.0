From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2016 15:55:05 +0200
Subject: [Buildroot] [PATCH] php-geoip: fix legal info
In-Reply-To: <1462886131-9724-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462886131-9724-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160510155505.1ecdf44e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 May 2016 10:15:31 -0300, Gustavo Zacarias wrote:
> The LICENSE file is gone, so use the lone .c source fle. Fixes:
> http://autobuild.buildroot.net/results/acd/acd763e7eefb8be2bbd0bf973bb7855fceee7377/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/php-geoip/php-geoip.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
