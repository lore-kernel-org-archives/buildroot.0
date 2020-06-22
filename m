From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:56:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: bump to version
 1.6.1
In-Reply-To: <20200608090442.2265237-1-aperez@igalia.com>
References: <20200608090442.2265237-1-aperez@igalia.com>
Message-ID: <20200622225605.79efb518@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Jun 2020 12:04:42 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This update brings in a few build fixes only. In particular the
> one for EGL implementations which use oddball definitions of the
> EGLNativeDisplayType type might be needed for some configurations.
> 
> Full release notes:
> 
>   https://wpewebkit.org/release/wpebackend-fdo-1.6.1.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
>  package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
