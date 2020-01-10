From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 22:55:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11/xserver_xorg-server: fix
 build without glx
In-Reply-To: <20200108213928.3581531-1-fontaine.fabrice@gmail.com>
References: <20200108213928.3581531-1-fontaine.fabrice@gmail.com>
Message-ID: <20200110225519.20de7c42@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Jan 2020 22:39:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/de838a843f97673d1381a55fd4e9b07164693913
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...mon-xf86Init.c-fix-build-without-glx.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/x11r7/xserver_xorg-server/1.20.6/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
