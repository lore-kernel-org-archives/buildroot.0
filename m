From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 18:38:30 +0100
Subject: [Buildroot] [PATCH v3 1/7] libepoxy: move outside x11r7 scope
In-Reply-To: <1457517525-7716-2-git-send-email-gustavo@zacarias.com.ar>
References: <1457517525-7716-1-git-send-email-gustavo@zacarias.com.ar>
 <1457517525-7716-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160320183830.749b1b56@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Mar 2016 06:58:39 -0300, Gustavo Zacarias wrote:

> diff --git a/package/libepoxy/0001-make-egl-and-glx-conditional.patch b/package/libepoxy/0001-make-egl-and-glx-conditional.patch
> new file mode 100644
> index 0000000..9952f38
> --- /dev/null
> +++ b/package/libepoxy/0001-make-egl-and-glx-conditional.patch
> @@ -0,0 +1,319 @@
> +Fetched from pull #81 on github for libepoxy:
> +https://github.com/anholt/libepoxy/pull/81/files
> +
> +Status: not yet upstream.
> +
> +From 7eff2bf8e27599c1c94217b2bb1b73d4b7d18e59 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
> +Date: Wed, 6 May 2015 10:45:22 +0200
> +Subject: [PATCH 1/4] select platforms based on configuration results
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: Andreas M?ller <schnitzeltony@googlemail.com>

This patch should have been 4 separate patches. So I've split it into
the 4 original patches, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
