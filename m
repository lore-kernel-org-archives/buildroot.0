From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 23:35:22 +0100
Subject: [Buildroot] [PATCH v2 14/18] erlang-p1-xml: bump to version
 1.1.1
In-Reply-To: <1454443064-14269-15-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-15-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160220233522.445645d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Tue,  2 Feb 2016 14:57:40 -0500, Frank Hunleth wrote:
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v1->v2:
>   - Fix license file name
> 
>  package/erlang-p1-xml/erlang-p1-xml.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
> index f81d3e5..36c1537 100644
> --- a/package/erlang-p1-xml/erlang-p1-xml.mk
> +++ b/package/erlang-p1-xml/erlang-p1-xml.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -ERLANG_P1_XML_VERSION = 2c61083
> +ERLANG_P1_XML_VERSION = 1.1.1
>  ERLANG_P1_XML_SITE = $(call github,processone,xml,$(ERLANG_P1_XML_VERSION))
>  ERLANG_P1_XML_LICENSE = GPLv2+
> -ERLANG_P1_XML_LICENSE_FILES = COPYING
> +ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
>  ERLANG_P1_XML_DEPENDENCIES = expat
>  ERLANG_P1_XML_INSTALL_STAGING = YES

As noticed by Romain Naour, a dependency on erlang-p1-utils was
missing, I could verified that with a build test. Also, the license has
changed from GPLv2+ to Apache-2.0. So I've applied to next with the
following changes:

    [Thomas:
      - add dependency on erlang-p1-utils, as noticed by Romain Naour.
      - the license is now Apache-2.0 and no longer GPLv2+.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
