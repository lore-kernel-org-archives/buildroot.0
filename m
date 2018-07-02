From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 23:05:32 +0200
Subject: [Buildroot] [PATCH 1/1] qt5charts: fix license
In-Reply-To: <20180702092137.25394-1-sebastien.szymanski@armadeus.com>
References: <20180702092137.25394-1-sebastien.szymanski@armadeus.com>
Message-ID: <20180702230532.40820286@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this fix!

On Mon,  2 Jul 2018 11:21:37 +0200, S?bastien Szymanski wrote:
> qt5charts-2.1.3 (build with Qt 5.6) doesn't contain any license files so
> remove LICENSE.GPL3 from QT5CHARTS_LICENSE_FILES when building Qt 5.6.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/c95d34129902a0511b8d64c9d50f1ffa293b33fd
>  http://autobuild.buildroot.net/results/b9c14ce7c2fdaa412eb6416ae12a0376aaf05770
>  http://autobuild.buildroot.net/results/1bde69c515d9140ef0f9a5571475c2850c7b8dee

Please leave a blank line before the Signed-off-by.

> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

I've applied to master, however...

> ---
>  package/qt5/qt5charts/qt5charts.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
> index 71d0e54027..9e2e6de881 100644
> --- a/package/qt5/qt5charts/qt5charts.mk
> +++ b/package/qt5/qt5charts/qt5charts.mk
> @@ -16,7 +16,9 @@ QT5CHARTS_DEPENDENCIES = qt5base
>  QT5CHARTS_INSTALL_STAGING = YES
>  
>  QT5CHARTS_LICENSE = GPL-3.0

... are we sure the license is GPL-3.0 for both versions of qt5charts ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
