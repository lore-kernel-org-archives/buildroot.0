From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Nov 2018 23:02:53 +0100
Subject: [Buildroot] [PATCH] package/xproto_inputproto: disable
 documentation
In-Reply-To: <1542596449-55950-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1542596449-55950-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5cd0c629-c5b4-1082-ef21-96b55ff99f8a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Matt,

On 19/11/2018 04:00, Matt Weber wrote:
> Resolves:

 Please use "Fixes:", then it shows up in the "F" column in patchwork.

 Regards,
 Arnout

> http://autobuild.buildroot.net/results/e6b/e6badde04047e10023b97946bbff434abc07344d/
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/x11r7/xproto_inputproto/xproto_inputproto.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
> index 20169b5..5b3c63a 100644
> --- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
> +++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
> @@ -11,6 +11,7 @@ XPROTO_INPUTPROTO_LICENSE = MIT
>  XPROTO_INPUTPROTO_LICENSE_FILES = COPYING
>  XPROTO_INPUTPROTO_INSTALL_STAGING = YES
>  XPROTO_INPUTPROTO_INSTALL_TARGET = NO
> +XPROTO_INPUTPROTO_CONF_ENV = ac_cv_path_ASCIIDOC=""
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> 
