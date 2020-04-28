From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 07:43:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libspatialindex: fix build with
 microblaze
In-Reply-To: <20200424175345.829372-1-fontaine.fabrice@gmail.com>
References: <20200424175345.829372-1-fontaine.fabrice@gmail.com>
Message-ID: <20200428074310.63bfc3ad@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 19:53:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add an upstream patch so the microblaze workaround for gcc bug 68485
> won't get ignored
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e4ad8fdeafce9d4a07d5554d98dfcb2fa5c05568
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
