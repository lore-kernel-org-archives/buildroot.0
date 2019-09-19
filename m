From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 22:22:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version
 2.26.0
In-Reply-To: <20190919142752.1728803-1-aperez@igalia.com>
References: <20190919142752.1728803-1-aperez@igalia.com>
Message-ID: <20190919222256.5870a51a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Sep 2019 17:27:52 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a new major release which brings in many improvements and new
> features. For a complete list, please refer to the release notes:
> 
>   https://webkitgtk.org/2019/09/09/webkitgtk2.26.0-released.html
> 
> A small patch is added which fixes a build failure when X11 headers
> are no available (for example, when building a Wayland-only system)
> 
> The new support for the WPE renderer on Wayland and the new Bubblewrap
> sandbox need additional dependencies and therefore are explicitly
> disabled at the moment.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...latform.h-is-build-broken-with-DENAB.patch | 40 +++++++++++++++++++
>  package/webkitgtk/webkitgtk.hash              |  8 ++--
>  package/webkitgtk/webkitgtk.mk                |  6 ++-
>  3 files changed, 48 insertions(+), 6 deletions(-)
>  create mode 100644 package/webkitgtk/0001-GTK-ANGLE-s-eglplatform.h-is-build-broken-with-DENAB.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
