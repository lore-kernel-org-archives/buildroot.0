From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 21:54:12 +0200
Subject: [Buildroot] [PATCH v2 2/2] qt5: bump latest version to 5.9.2
In-Reply-To: <20171017191655.17723-2-ps.report@gmx.net>
References: <20171017191655.17723-1-ps.report@gmx.net>
 <20171017191655.17723-2-ps.report@gmx.net>
Message-ID: <20171017215412.0343168a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 21:16:55 +0200, Peter Seiderer wrote:
> qt5base:
>   - removed 0001-Fix-error-attribute-target-crc-is-unknown.patch
>     (upstream committed, see [1])
>   - removed 0002-examples-fix-compile-without-opengl-support.patch
>     (upstream committed, see [2])
> 
> qt5declarative:
>   - removed 0001-Fix-alignment-issue-on-ARMv7.patch
>     (upstream committed, see [3])
>   - moved 0001-examples-photoviewer-needs-widgets-support.patch to 5.6.2
>     only (upstream 5.9.2 committed, see [4])
>   - moved 0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
>     to 5.6.2 only (similare patch upstream committed, see [5])
> 
> qt5location:
>   - removed 0001-Fix-plugins-build-dependency.patch
>     (upstream committed, see [6])
> 
> qt5webchannel:
>  - fix webchannel.js installation to target (the locatinon of the
>    file webchannel.js changed from src/webchannel/qwebchannel.js
>    to examples/webchannel/shared/qwebchannel.js, see commit [7])
> 
> qt5webengine:
>   - removed 0001-Always-compile-QWebEnginePage-print.patch
>     (upstream committed, see [8])
>   - keep 0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
>     (upstream committed, see [9], but reverted afterwards, see [10])
> 
> qt5webkit:
>  - fall back to 5.9.1 (no 5.9.2 package provided, see [11] and [12]).

Thanks for the good commit log, with references to upstream commits.

> diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
> index 8d1324a08a..451d0edcbb 100644
> --- a/package/qt5/qt53d/qt53d.hash
> +++ b/package/qt5/qt53d/qt53d.hash
> @@ -1,8 +1,9 @@
>  # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qt3d-opensource-src-5.6.2.tar.xz.mirrorlist
>  sha256 a21786db6e0f5c6c70213fe1a3530ed3d7f28f28401a0f793970e9bc860ce941 qt3d-opensource-src-5.6.2.tar.xz
>  
> -# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qt3d-opensource-src-5.9.1.tar.xz.mirrorlist
> -sha256 4f1fe5b812d78987341b854e7f2907f0375dc188cfa6cf9db101b26e9dfd4996 qt3d-opensource-src-5.9.1.tar.xz
> +<<<<<<< HEAD

Something went wrong here :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
