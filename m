From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Jan 2014 07:35:58 +0200
Subject: [Buildroot] [PATCH] libdmtx: add license information
In-Reply-To: <1389024846-17491-1-git-send-email-fhunleth@troodon-software.com>
References: <1389024846-17491-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20140107053558.GE4503@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,

On Mon, Jan 06, 2014 at 11:14:06AM -0500, Frank Hunleth wrote:
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/libdmtx/libdmtx.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
> index 69c7b88..43b35ec 100644
> --- a/package/libdmtx/libdmtx.mk
> +++ b/package/libdmtx/libdmtx.mk
> @@ -6,6 +6,8 @@
>  
>  LIBDMTX_VERSION = 0.7.4
>  LIBDMTX_SITE = http://downloads.sourceforge.net/project/libdmtx/libdmtx/$(LIBDMTX_VERSION)
> +LIBDMTX_LICENSE = BSD-2c or Commercial license
> +LIBDMTX_LICENSE_FILES = LICENSE

The "alternate terms" section in the LICENSE file states:

> Redistributions in binary form, with or without modification, are permitted 
> without including the above copyright notice, list of conditions, and  
> disclaimer if express written permission has been obtained from Dragonfly 
> Logic, Inc.

I wouldn't call this written permission a "commercial license", but IANAL.

baruch

>  LIBDMTX_INSTALL_STAGING = YES
>  
>  $(eval $(autotools-package))
> -- 
> 1.8.3.2

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
