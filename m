From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 14:13:47 +0200
Subject: [Buildroot] [PATCH v1] qt5multimedia: select Qt5OpenGL module
 in case OpenGL support is enabled
In-Reply-To: <20160517140733.52c3472c@gmx.net>
References: <1463483348-8157-1-git-send-email-ps.report@gmx.net>
 <20160517134515.0b826f02@free-electrons.com>
 <20160517140733.52c3472c@gmx.net>
Message-ID: <20160517141347.62a986c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 May 2016 14:07:33 +0200, Peter Seiderer wrote:

> > So it seems weird to enable OpenGL support in Qt but to not install the
> > corresponding library. Or are there use cases where OpenGL support is
> > used, but the Qt5OpenGL library is not needed?
> 
> E.g. qt5declarative/quick module selects BR2_PACKAGE_QT5BASE_OPENGL without
> BR2_PACKAGE_QT5BASE_OPENGL_LIB (and I think it works)..., maybe all not widget
> based OpenGL features...

OK, fair enough.

Then:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
