From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:27:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version
 2.32.2
In-Reply-To: <20210712192434.2229658-1-aperez@igalia.com>
References: <20210712192434.2229658-1-aperez@igalia.com>
Message-ID: <20210716232704.11b7138a@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 12 Jul 2021 22:24:34 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Bugfix release, mainly solves a few issues with input events,
> drag-and-drop, and a few crashes. Release notes:
> 
>   https://webkitgtk.org/2021/07/09/webkitgtk2.32.2-released.html
> 
> The patch for building against uClibc has been included in this release,
> therefore "0001-Support-building-against-uClibc.patch" is removed.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...0001-Support-building-against-uClibc.patch | 82 -------------------
>  package/webkitgtk/webkitgtk.hash              |  8 +-
>  package/webkitgtk/webkitgtk.mk                |  2 +-
>  3 files changed, 5 insertions(+), 87 deletions(-)
>  delete mode 100644 package/webkitgtk/0001-Support-building-against-uClibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
