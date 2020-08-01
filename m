From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Aug 2020 23:17:01 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8821au: add patch fixing
 sprintf error
In-Reply-To: <20200801203749.424827-1-christian@paral.in>
References: <20200801203749.424827-1-christian@paral.in>
Message-ID: <20200801231701.5c2615c3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Aug 2020 13:37:49 -0700
Christian Stewart <christian@paral.in> wrote:

> Fixes compile errors against certain kernels.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  ...f-for-extending-string-which-causes-.patch | 336 ++++++++++++++++++
>  1 file changed, 336 insertions(+)
>  create mode 100644 package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch
> 
> diff --git a/package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch b/package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch
> new file mode 100644
> index 0000000000..6753eefdd9
> --- /dev/null
> +++ b/package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch
> @@ -0,0 +1,336 @@
> +From cc3262a32ce326d89d597bb8557ce0da05240e98 Mon Sep 17 00:00:00 2001
> +From: Coleman <omegacoleman@gmail.com>
> +Date: Fri, 17 Jul 2020 08:53:00 +0800
> +Subject: [PATCH 3/3] Fix using sprintf for extending string, which causes

The 3/3 shouldn't be there, it causes a check-package warning.

> + undefined behavior. (#334)
> +

We need your Signed-off-by here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
