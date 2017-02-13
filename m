From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Feb 2017 08:44:45 -0600
Subject: [Buildroot] [PATCH 1/1] Install raptor package in staging
In-Reply-To: <1182785180.5405440.1486972873694@mail.yahoo.com>
References: <1182785180.5405440.1486972873694.ref@mail.yahoo.com>
 <1182785180.5405440.1486972873694@mail.yahoo.com>
Message-ID: <CANQCQpas02hTnx7e4y1DDjc+Pe9bR78oU0T4wbLXs_wtaiqDCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erwan,

On Mon, Feb 13, 2017 at 2:01 AM, Erwan Gautron <erwan.gautron@yahoo.fr> wrote:
> Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>
> ---
>  package/raptor/raptor.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
> index aea14e3..a2c2b23 100644
> --- a/package/raptor/raptor.mk
> +++ b/package/raptor/raptor.mk
> @@ -13,7 +13,7 @@ RAPTOR_LICENSE_FILES = LICENSE.txt
>
>  # Flag is added to make sure the patch is applied for the configure.ac of
> raptor.
>  RAPTOR_AUTORECONF = YES
> -
> +RAPTOR_INSTALL_STAGING=YES

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

>  RAPTOR_CONF_OPTS =\
>      --with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config \
>      --with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config
> --
> 2.7.4
>



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
