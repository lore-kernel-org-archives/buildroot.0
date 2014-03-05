From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Mar 2014 07:29:03 +0100
Subject: [Buildroot] [PATCH 03/13] Makefile: add BR2_DL_DIR to EXTRA_ENV
In-Reply-To: <b177514bfb864952ff6f2d1029c9830fc9e573fd.1393781650.git.yann.morin.1998@free.fr>
References: <cover.1393781649.git.yann.morin.1998@free.fr>
 <b177514bfb864952ff6f2d1029c9830fc9e573fd.1393781650.git.yann.morin.1998@free.fr>
Message-ID: <5316C42F.5000408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/03/14 18:51, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Also export BR2_DL_DIR for incoming download helper scripts.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/Makefile.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 2c0b8da..5460caa 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -282,6 +282,7 @@ HOST_MAKE_ENV=PATH=$(HOST_PATH) \
>  # explicitly pass it to user-supplied external hooks (eg. post-build,
>  # post-images)
>  EXTRA_ENV=\
> +	BR2_DL_DIR=$(BR2_DL_DIR) \
>  	BUILD_DIR=$(BUILD_DIR)
>  
>  ################################################################################
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
