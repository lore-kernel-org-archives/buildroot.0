From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:20:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/qt5: bump latest version to
 5.12.5
In-Reply-To: <20191006121331.11015-1-bernd.kuhls@t-online.de>
References: <20191006121331.11015-1-bernd.kuhls@t-online.de>
Message-ID: <20191007222032.0dd5d014@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 14:13:30 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patches applied upstream:
> 
> - qt5base/5.12.4/0005-Fix-dependency_libs-entry-of-.la-files.patch
> https://codereview.qt-project.org/gitweb?p=qt/qtbase.git;a=commitdiff;h=8c0787cfa1a906ebe25907515d86050303b127e7
> 
> - qt5/qt5multimedia/5.12.5/0001-Fix-compile-issue-when-no-opengl-in-QVideoSurfacePainter.patch

                       ^^^^^ typo here, it should have been 5.12.4 of course

I fixed that up and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
