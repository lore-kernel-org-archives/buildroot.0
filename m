From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:49:58 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: Add Jagan Teki as maintainer
 for olimex A33 olinuxino
In-Reply-To: <1569309607-10252-1-git-send-email-mayhs11saini@gmail.com>
References: <1569309607-10252-1-git-send-email-mayhs11saini@gmail.com>
Message-ID: <20190927224958.25f8c783@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Sep 2019 12:50:07 +0530
Shyam Saini <mayhs11saini@gmail.com> wrote:

> I no longer work at Amarula Solutions and neither do I have access to
> olimex A33 olinuxino board. So, add Jagan as maintainer of this board.
> 
> Signed-off-by: Shyam Saini <mayhs11saini@gmail.com>
> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9b771f4957b0..88e5689a3ad0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2121,7 +2121,7 @@ F:	package/tunctl/
>  F:	package/ubus/
>  F:	package/wolfssl/
>  
> -N:	Shyam Saini <shyam.saini@amarulasolutions.com>
> +N:	Jagan Teki <jagan@amarulasolutions.com>

You shouldn't have renamed the entry... as (1) it breaks alphabetic
ordering and (2) there was already an entry for Jagan.

So I fixed that up and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
