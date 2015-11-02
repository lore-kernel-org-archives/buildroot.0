From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 2 Nov 2015 06:25:20 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/git: Add needed library for
 static compilation
In-Reply-To: <1446410183-7798-2-git-send-email-repk@triplefau.lt>
References: <1446410183-7798-1-git-send-email-repk@triplefau.lt>
 <1446410183-7798-2-git-send-email-repk@triplefau.lt>
Message-ID: <20151102042520.GM3352@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Remi,

On Sun, Nov 01, 2015 at 09:36:21PM +0100, Remi Pommarel wrote:
> @@ -57,7 +57,7 @@ endif
>  
>  # assume yes for these tests, configure will bail out otherwise
>  # saying error: cannot run test program while cross compiling
> -GIT_CONF_ENV = \
> +GIT_CONF_ENV += \
>  	ac_cv_fread_reads_directories=yes \
>  	ac_cv_snprintf_returns_bogus=yes LIBS='$(GIT_CONF_ENV_LIBS)'

Please move this hunk to patch #3 in this series, which is where it logically 
belongs.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
