From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 23:21:59 +0200
Subject: [Buildroot] [PATCH 4/4] DEVELOPERS: list {,
 net}atop package under my name
In-Reply-To: <20161007203031.21528-4-ricardo.martincoski@datacom.ind.br>
References: <20161007203031.21528-1-ricardo.martincoski@datacom.ind.br>
 <20161007203031.21528-4-ricardo.martincoski@datacom.ind.br>
Message-ID: <20161007232159.6f1f9817@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Oct 2016 17:30:31 -0300, Ricardo Martincoski wrote:
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> ---
>  DEVELOPERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5dd5066..0deaefe 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1203,6 +1203,10 @@ F:	package/gupnp-av/
>  N:	Renaud Aubin <root@renaud.io>
>  F:	package/libhttpparser/
>  
> +N:	Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> +F:	package/atop/
> +F:	package/netatop/

Since I haven't applied the netatop package, I've removed this line,
and applied the rest of your patch (so that you receive atop
autobuilder failures, if any).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
