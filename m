From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 Aug 2018 13:00:00 +0300
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add Mirza Krak to mender
 package
In-Reply-To: <20180822080623.15435-1-mirza.krak@northern.tech>
References: <20180822080623.15435-1-mirza.krak@northern.tech>
Message-ID: <20180822100000.dc6di4qwh7je4fjg@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mirza,

On Wed, Aug 22, 2018 at 10:06:23AM +0200, Mirza Krak wrote:
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---
>  DEVELOPERS | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 215506c71c..f6426e5ebe 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -142,10 +142,13 @@ F:	package/rauc/
>  N:	Andy Kennedy <andy.kennedy@adtran.com>
>  F:	package/libunwind/
>  
> +N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
> +N:	Mirza Krak <mirza.krak@northern.tech>
> +F:	package/mender/

As the name of this file suggests, this is a list of developer entries, not a 
list of packages. The same package can appear in multiple entries. But there 
is only one developer per entry.

So, create an entry for you (please keep alphabetic order), and list mender as 
a package you are interested in.

> +
>  N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
>  F:	package/corkscrew/
>  F:	package/i2c-tools/
> -F:	package/mender/
>  F:	package/mono/
>  F:	package/mono-gtksharp3/
>  F:	package/monolite/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
