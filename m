From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 13 Sep 2014 21:43:29 +0300
Subject: [Buildroot] [PATCH] heirloom-mailx: add license info
In-Reply-To: <1410584439-31668-1-git-send-email-danomimanchego123@gmail.com>
References: <1410584439-31668-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140913184329.GA11424@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi,

On Sat, Sep 13, 2014 at 01:00:39AM -0400, Danomi Manchego wrote:
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/heirloom-mailx/heirloom-mailx.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
> index 75221d4..0a80a3c 100644
> --- a/package/heirloom-mailx/heirloom-mailx.mk
> +++ b/package/heirloom-mailx/heirloom-mailx.mk
> @@ -7,6 +7,8 @@
>  HEIRLOOM_MAILX_VERSION = 12.5
>  HEIRLOOM_MAILX_SOURCE  = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
>  HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx
> +HEIRLOOM_MAILX_LICENSE = BSD-4c, Bellcore (base64), IEEE (docs), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPLv1.1 (nss)

Do we install these IEEE licensed docs? If not I think we can omit this 
license. IANAL, though.

baruch

> +HEIRLOOM_MAILX_LICENSE_FILES = COPYING
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  HEIRLOOM_MAILX_DEPENDENCIES += openssl

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
