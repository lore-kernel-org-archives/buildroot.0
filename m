From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 23:03:02 +0100
Subject: [Buildroot] [PATCH v4] qt5: remove Qt Quick dependency on opengl
In-Reply-To: <1509658876-29888-1-git-send-email-joshua.henderson@microchip.com>
References: <1509658876-29888-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20171102230302.26744909@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 14:41:16 -0700, Joshua Henderson wrote:

> diff --git a/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch b/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
> new file mode 100644
> index 0000000..aca93be
> --- /dev/null
> +++ b/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
> @@ -0,0 +1,29 @@
> +From fa52bb665d6beb77a951c14c8edcba3541850afc Mon Sep 17 00:00:00 2001
> +From: Allan Sandfeld Jensen <allan.jensen@qt.io>
> +Date: Mon, 25 Sep 2017 16:53:24 +0200
> +Subject: [PATCH] Fix no-opengl builds
> +
> +The qquickwidgets examples uses OpenGL directly
> +
> +Change-Id: I1cc8cfbcf249abc98473287a9d499032232828c7
> +Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>

Who did the backport of this patch in Buildroot? It should carry the
Signed-off-by from the person who did this backport. I don't know if
it's you or S?bastien Szymanski.

Also, another question: I assume that if OpenGL is available, Qt Quick
will use it. How does it detect that OpenGL is available?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
