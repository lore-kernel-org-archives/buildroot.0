From: =?windows-1252?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Wed, 11 Mar 2015 21:47:55 +0100
Subject: [Buildroot] [PATCH] avahi: add hash file
In-Reply-To: <1426101989-20525-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426101989-20525-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5500A9FB.3090307@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 11.03.2015 um 20:26 schrieb Gustavo Zacarias:
> Help counteract upstream website issues, fixes:
> http://autobuild.buildroot.net/results/103/103e5a62d16ed22414cc407eff8a78d5e8d7503c/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/avahi/avahi.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/avahi/avahi.hash
> 
> diff --git a/package/avahi/avahi.hash b/package/avahi/avahi.hash
> new file mode 100644
> index 0000000..99bbd51
> --- /dev/null
> +++ b/package/avahi/avahi.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48	avahi-0.6.31.tar.gz
> 

This fixes the issue, but we should take care if the website is not going back up again

Tested-by: Andr? Hentschel <nerv@dawncrow.de>
Reviewed-by: Andr? Hentschel <nerv@dawncrow.de>
Acked-by: Andr? Hentschel <nerv@dawncrow.de>
