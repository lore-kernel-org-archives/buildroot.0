From: =?utf-8?Q?=C3=89meric?= Vigier <emeric.vigier@savoirfairelinux.com>
Date: Fri, 4 Apr 2014 15:36:14 -0400 (EDT)
Subject: [Buildroot] new package not built, AR prefix not passed to make
In-Reply-To: <533E4361.9000302@mind.be>
Message-ID: <775153222.434238.1396640173956.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Mail original -----
> De: "Arnout Vandecappelle" <arnout@mind.be>
> ?: "?meric Vigier" <emeric.vigier@savoirfairelinux.com>, buildroot at busybox.net
> Envoy?: Vendredi 4 Avril 2014 01:30:09
> Objet: Re: [Buildroot] new package not built, AR prefix not passed to make
> 
> On 03/04/14 17:32, ?meric Vigier wrote:
> [snip]
> >   $ cat package/company/libfpga/Config.in
> >   config BR2_PACKAGE_COMPANY_LIBFPGA
> 
>  Either the symbol should be BR2_PACKAGE_LIBFPGA, or the directory
>  should
> be package/company/company-libfpga (and the .mk file
> package/company/company-libfpga/company-libfpga.mk).

This is it, thanks!

> 
>  Regards,
>  Arnout
