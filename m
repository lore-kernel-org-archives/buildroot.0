From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:56:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/gst1-plugins-good: fix xlib
 dependencies
In-Reply-To: <20191016165512.2283-1-fontaine.fabrice@gmail.com>
References: <20191016165512.2283-1-fontaine.fabrice@gmail.com>
Message-ID: <20191016215606.16a16859@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Oct 2019 18:55:12 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> xlib_libXfixes and xlib_libXdamage must be added to dependencies
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/efc1052807f94b1013cc8c13bdd790a01ed7255d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../gst1-plugins-good/gst1-plugins-good.mk          | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
