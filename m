From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 15:29:45 +0200
Subject: [Buildroot] [PATCH] jquery-ui: switch to sources.buildroot.net
In-Reply-To: <1397566383-4491-1-git-send-email-gustavo@zacarias.com.ar>
References: <1397566383-4491-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140415152945.1a1f6d92@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 15 Apr 2014 09:53:03 -0300, Gustavo Zacarias wrote:
> Switch to sources.buildroot.net cached zipfile.
> Upstream changed the zipfile and the internal directory structure
> without notifying anyone or changing the filename thus causing breakage.
> And we can't use github release tarballs since they are not minified.
> And we shouldn't reflect this in the install hook since an old cached
> tarball wouldn't work, and we'd break anyone using the old package file
> with the new one too. Thanks upstream! Fixes:
> http://autobuild.buildroot.net/results/43a/43a16a44a26b38f4c6a2f352d8bfe5e07af6b2e3/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/jquery-ui/jquery-ui.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
> index 5eadf53..deadf20 100644
> --- a/package/jquery-ui/jquery-ui.mk
> +++ b/package/jquery-ui/jquery-ui.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  JQUERY_UI_VERSION = 1.10.4
> -JQUERY_UI_SITE = http://jqueryui.com/resources/download
> +JQUERY_UI_SITE = http://sources.buildroot.net

Could you replicate the commit log explanation here above this line, in
a comment?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
