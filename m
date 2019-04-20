From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 15:33:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/xserver_xorg-server: fix build
 without glx
In-Reply-To: <20190419084836.21364-1-fontaine.fabrice@gmail.com>
References: <20190419084836.21364-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420153301.6a554cc2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Apr 2019 10:48:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/397f8098c57fc6c88aa12dc8d35ebb1b933d52ef
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...nd-Makefile.am-fix-build-without-glx.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/x11r7/xserver_xorg-server/1.20.4/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
