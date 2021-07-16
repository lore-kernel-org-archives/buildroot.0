From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:26:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.32.2
In-Reply-To: <20210712191911.2148537-1-aperez@igalia.com>
References: <20210712191911.2148537-1-aperez@igalia.com>
Message-ID: <20210716232658.238792d3@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 12 Jul 2021 22:19:11 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Bugfix release, mainly solves a few issues with input events and a
> few crashes. Release notes:
> 
>   https://wpewebkit.org/release/wpewebkit-2.32.2.html
> 
> The patch for building against uClibc has been included in this release,
> therefore "0001-Support-building-against-uClibc.patch" is removed.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...0001-Support-building-against-uClibc.patch | 82 -------------------
>  package/wpewebkit/wpewebkit.hash              |  8 +-
>  package/wpewebkit/wpewebkit.mk                |  2 +-
>  3 files changed, 5 insertions(+), 87 deletions(-)
>  delete mode 100644 package/wpewebkit/0001-Support-building-against-uClibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
