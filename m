From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 15:57:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/libwpe: bump to version 1.2.1
In-Reply-To: <20190819115805.24962-1-aperez@igalia.com>
References: <20190819115805.24962-1-aperez@igalia.com>
Message-ID: <20190819155738.3b6d0a24@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Aug 2019 14:58:05 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a bugfix release of libwpe, which fixes an issue with memory
> allocation for the pasteboard, adds some missing Unicode-to-KeySym
> conversions, and fixes a build issue. Full release notes:
> 
>   https://wpewebkit.org/release/libwpe-1.2.1.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/libwpe/libwpe.hash | 8 ++++----
>  package/libwpe/libwpe.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Normally version bumps are only for next, but here it's really just 3
small commits that are all fixes, so I've applied to master.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
