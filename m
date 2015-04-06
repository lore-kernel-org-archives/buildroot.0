From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 06 Apr 2015 22:08:34 +0200
Subject: [Buildroot] [PATCH 1/4] package/thrift: reorders alphabetically
 the dependencies.
In-Reply-To: <1428339450-2158-1-git-send-email-romain.naour@openwide.fr>
References: <1428339450-2158-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <5522E7C2.40606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 18:57, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/thrift/thrift.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
> index 094f8d0..409b04d 100644
> --- a/package/thrift/thrift.mk
> +++ b/package/thrift/thrift.mk
> @@ -8,8 +8,9 @@ THRIFT_VERSION = 0.9.2
>  THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
>  THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost libevent openssl zlib
>  THRIFT_INSTALL_STAGING = YES
> -HOST_THRIFT_DEPENDENCIES = host-boost host-libevent host-openssl host-pkgconf \
> -	host-zlib host-bison host-flex
> +HOST_THRIFT_DEPENDENCIES = host-bison host-boost host-flex host-libevent \
> +	host-openssl host-pkgconf host-zlib
> +
>  THRIFT_CONF_OPTS = --with-sysroot=$(STAGING_DIR) \
>  	--with-boost \
>  	--with-boost-libdir=$(STAGING_DIR)/usr/lib \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
