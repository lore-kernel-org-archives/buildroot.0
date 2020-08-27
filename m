From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:25:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-matplotlib: simplify
 version checks
In-Reply-To: <20200827172140.137791-1-fontaine.fabrice@gmail.com>
References: <20200827172140.137791-1-fontaine.fabrice@gmail.com>
Message-ID: <20200827232546.16190023@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Aug 2020 19:21:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Hopefully, this should fix the following error on one of the
> autobuilders:
> 
> png: no  [The C/C++ header for libpng (png.h) could not
>      be found.  You may need to install the development
>      package.]
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/afddcc44b2fb7983244f24542bfae921869e4ab8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...st-11983-from-anntzer-builddepchecks.patch | 170 ++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 package/python-matplotlib/0002-Merge-pull-request-11983-from-anntzer-builddepchecks.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
