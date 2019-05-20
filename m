From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 21:33:18 +0200
Subject: [Buildroot] [PATCH 2/5] package/wpebackend-fdo: bump to version
 1.2.0
In-Reply-To: <20190514114111.20424-3-aperez@igalia.com>
References: <20190514114111.20424-1-aperez@igalia.com>
 <20190514114111.20424-3-aperez@igalia.com>
Message-ID: <20190520213318.6deef9c6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 May 2019 14:41:08 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> WPE WebKit 2.24.x requires WPEBackend-fdo 1.2.x, as indicated at:
> 
>   https://wpewebkit.org/release/schedule/#compatible-components
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
>  package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

I've marked this patch, as well as PATCH 4/5 and 5/5 as Changes
Requested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
