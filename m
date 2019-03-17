From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:07:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/fltk: add optional
 xlib_libXrender dependency
In-Reply-To: <20190317152929.27559-1-fontaine.fabrice@gmail.com>
References: <20190317152929.27559-1-fontaine.fabrice@gmail.com>
Message-ID: <20190317170750.691f2f50@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 16:29:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> xlib_libXrender is enabled by default and has been added since version
> 1.3.4-1 and
> https://github.com/fltk/fltk/commit/a6c4b29a184ce7708819f4706877eedcd99a30f5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fltk/fltk.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
