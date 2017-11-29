From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 28 Nov 2017 22:28:36 -0500
Subject: [Buildroot] [PATCH v1] qt5: bump latest version to 5.9.3
In-Reply-To: <20171128223744.28422-1-ps.report@gmx.net>
References: <20171128223744.28422-1-ps.report@gmx.net>
Message-ID: <20171129032836.7tuz72iylth5mf4l@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Nov 28, 2017 at 11:37:44PM +0100, Peter Seiderer wrote:
> qt5connectivity:
>  - moved 0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
>    to 5.9.3
> 
> qt5declarative:
>  - removed 0001-Fix-no-opengl-builds.patch to 5.9.3 (upstream committed,
>    see [1])
> 
> qt5webengine:
>  - keep 0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
>    (upstream committed, see [2], but reverted afterwards, see [3])
> 
> [1] https://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=fa52bb665d6beb77a951c14c8edcba3541850afc
> [2] https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=d4c621f6a6b87f2a86069fa393b9f7c4f9e7b9ad
> [3] https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=c11c2c8981e647c1eb2c6753ce77d436b92fff87
> ---
>

I have tested most of the examples on a rpi3 (qtwebengine, qtwebkit,
qtdeclarative, qtquickcontrols, gui, opengl...).

Regards,
Gael
