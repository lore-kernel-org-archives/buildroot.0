From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 16:32:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5multimedia: fix build
 without opengl
In-Reply-To: <20190815223403.9249-1-fontaine.fabrice@gmail.com>
References: <20190815223403.9249-1-fontaine.fabrice@gmail.com>
Message-ID: <20190817163241.68f61f41@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 16 Aug 2019 00:34:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/fc7bcc6b3ccf1e075dce43296b36e7e1cac417db
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...en-no-opengl-in-QVideoSurfacePainter.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/qt5/qt5multimedia/5.12.4/0001-Fix-compile-issue-when-no-opengl-in-QVideoSurfacePainter.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
