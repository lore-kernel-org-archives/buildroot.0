From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 21:53:33 +0200
Subject: [Buildroot] [PATCH/next 1/9] package/c-icap: fix berkeleydb
 configure option
In-Reply-To: <20170521214124.20328-1-bernd.kuhls@t-online.de>
References: <20170521214124.20328-1-bernd.kuhls@t-online.de>
Message-ID: <20170522215333.4af43189@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 May 2017 23:41:16 +0200, Bernd Kuhls wrote:
> The configure option controlling berkeleydb support got its current
> name in 2009: https://sourceforge.net/p/c-icap/code/322/
> 
> This patch fixes a configure warning:
> 
> configure: WARNING: unrecognized options: [...] --without-berkeleydb, [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/c-icap/c-icap.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This is a fix, so I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
