From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 09 Oct 2013 18:04:13 +0200
Subject: [Buildroot] [PATCH 1/2] xmlstarlet: add license information
In-Reply-To: <1381281980.27485.2.camel@phoenix>
References: <1381281980.27485.2.camel@phoenix>
Message-ID: <52557E7D.8060204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 03:26, Axel Lin wrote:
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>   package/xmlstarlet/xmlstarlet.mk | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
> index f0a26c2..4a30feb 100644
> --- a/package/xmlstarlet/xmlstarlet.mk
> +++ b/package/xmlstarlet/xmlstarlet.mk
> @@ -6,6 +6,8 @@
>
>   XMLSTARLET_VERSION = 1.3.0
>   XMLSTARLET_SITE = http://downloads.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
> +XMLSTARLET_LICENSE = MIT
> +XMLSTARLET_LICENSE_FILES = COPYING Copyright

  These two files are identical, so no need to copy both of them.

  Otherwise,

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

>
>   XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
>   	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
