From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Mar 2018 22:23:12 +0100
Subject: [Buildroot] [PATCH/next 1/1] libepoxy: bump to version 1.5.0,
 add license hash
In-Reply-To: <20180302130428.92132-1-aperez@igalia.com>
References: <20180302130428.92132-1-aperez@igalia.com>
Message-ID: <20180302222312.192cb340@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Mar 2018 15:04:28 +0200, Adrian Perez de Castro wrote:
> This release of Epoxy makes "0001-Forward-EGL-cflags-into-epoxy.pc.patch"
> unnecessary. Other than bugfixes and a couple of functions added to the
> API, this release is backwards-compatible with programs built against
> the 1.4.x releases.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  .../0001-Forward-EGL-cflags-into-epoxy.pc.patch    | 32 ----------------------
>  package/libepoxy/libepoxy.hash                     |  7 +++--
>  package/libepoxy/libepoxy.mk                       |  4 +--
>  3 files changed, 7 insertions(+), 36 deletions(-)
>  delete mode 100644 package/libepoxy/0001-Forward-EGL-cflags-into-epoxy.pc.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
