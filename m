From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Nov 2016 10:50:35 +0100
Subject: [Buildroot] [PATCH v1] qwt: fix qt5 opengl support
In-Reply-To: <1479506412-28270-1-git-send-email-ps.report@gmx.net>
References: <1479506412-28270-1-git-send-email-ps.report@gmx.net>
Message-ID: <20161119105035.43de950b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 23:00:12 +0100, Peter Seiderer wrote:
> Qt5base BR2_PACKAGE_QT5BASE_OPENGL_LIB depends on BR2_PACKAGE_QT5BASE_OPENGL (see
> package/qt5/qt5base/Config.in), so select it.
> 
> Fixes [1]:
> 
>   cp: cannot stat '.../output/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/lib/libQt5OpenGL.so.*': No such file or directory
> 
> [1] http://autobuild.buildroot.net/results/262/2623d48194b778c92134f9bceea923749b26ac6b
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qwt/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
