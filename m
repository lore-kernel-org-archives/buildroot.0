From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 1 May 2014 16:42:48 +0300
Subject: [Buildroot] [PATCH 1/1] qlibc : new package
In-Reply-To: <1398949151-18546-1-git-send-email-sagaert.johan@skynet.be>
References: <1398949151-18546-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20140501134248.GZ4531@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sagaert Johan,

On Thu, May 01, 2014 at 02:59:11PM +0200, Sagaert Johan wrote:

[...]

> diff --git a/package/qlibc/Config.in b/package/qlibc/Config.in
> new file mode 100644
> index 0000000..5efda60
> --- /dev/null
> +++ b/package/qlibc/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_QLIBC
> +	bool "qlibc"
> +	help
> +	  qLibc is currently one of the most functionally
> +	  complete public licensed C/C++ libraries.
> +	  The C/C++ library which includes all kinds of containers
> +	  and general library routines.It provides ready-made set
> +	  of common container APIs with consistant API look.
> +	  
> +	  http://www.qdecoder.org/wiki/qlibc

This page begins with the following test: "Project home has moved to GitHub". 
Wouldn't https://github.com/wolkykim/qlibc be more appropriate here?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
