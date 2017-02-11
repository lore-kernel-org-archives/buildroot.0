From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 16:44:55 +0100
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH_2/2=5D_DEVELOPERS=3A_add_J=C3=B6rg?=
 =?utf-8?q?__Krause_for_augeus?=
In-Reply-To: <20170210110013.30448-2-joerg.krause@embedded.rocks>
References: <20170210110013.30448-1-joerg.krause@embedded.rocks>
 <20170210110013.30448-2-joerg.krause@embedded.rocks>
Message-ID: <20170211164455.64a95639@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Feb 2017 12:00:13 +0100, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b8ccb4615..71f9fcad3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -893,6 +893,7 @@ F:	package/x11r7/xdriver_xf86-video-imx/
>  F:	package/x11r7/xdriver_xf86-video-imx-viv/
>  
>  N:	J?rg Krause <joerg.krause@embedded.rocks>
> +F:	package/augeas/
>  F:	package/bctoolbox/
>  F:	package/libshout/
>  F:	package/libupnpp/

We have changed our mind at the last Buildroot developers meeting. We
now want the modification to the DEVELOPERS file to be part of the
patch adding the package. Since you received some feedback on the .mk
file itself, could you resubmit, with the DEVELOPERS changes merged in
the main patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
