From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2013 21:54:43 +0200
Subject: [Buildroot] [git commit] gmp: bump to version 5.1.2
In-Reply-To: <20130528130059.6B3E39A61F@busybox.osuosl.org>
References: <20130528130059.6B3E39A61F@busybox.osuosl.org>
Message-ID: <51A50B83.3010106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/05/13 14:59, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=78927d3f92f0a397e9551dee491e26602e63a30a
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

  How come this version bump is applied to master instead of next?

  Regards,
  Arnout

>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>   package/gmp/gmp.mk |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
> index e895a48..cf5c310 100644
> --- a/package/gmp/gmp.mk
> +++ b/package/gmp/gmp.mk
> @@ -4,7 +4,7 @@
>   #
>   #############################################################
>
> -GMP_VERSION = 5.1.1
> +GMP_VERSION = 5.1.2
>   GMP_SITE = ftp://ftp.gmplib.org/pub/gmp-$(GMP_VERSION)
>   GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
>   GMP_INSTALL_STAGING = YES
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
