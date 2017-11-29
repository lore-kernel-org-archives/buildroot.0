From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:53:24 +0100
Subject: [Buildroot] [PATCH v1] qt5: bump latest version to 5.9.3
In-Reply-To: <20171128223744.28422-1-ps.report@gmx.net>
References: <20171128223744.28422-1-ps.report@gmx.net>
Message-ID: <20171129215324.434e0b67@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Nov 2017 23:37:44 +0100, Peter Seiderer wrote:
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

This patch currently doesn't apply on next. There is a trivial conflict
with the QT5_SITE variable cleanup from Ga?l, and there is an issue
with the qt5connectivity patch, which doesn't exist in the next branch
at this point.

Since 2017.11 is about to be released, I'll merge this patch once next
is merged back in the master branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
