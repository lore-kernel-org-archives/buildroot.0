From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 22:23:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/luv: bump to version 1.34.2-2
In-Reply-To: <20200318080257.7268-1-joerg.krause@embedded.rocks>
References: <20200318080257.7268-1-joerg.krause@embedded.rocks>
Message-ID: <20200318222318.374c8fd2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Mar 2020 09:02:57 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Drop pathch 0001 which was applied upstream.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...01-src-lreq.c-fix-build-with-gcc-4.8.patch | 43 -------------------
>  package/luv/luv.hash                          |  2 +-
>  package/luv/luv.mk                            |  2 +-
>  3 files changed, 2 insertions(+), 45 deletions(-)
>  delete mode 100644 package/luv/0001-src-lreq.c-fix-build-with-gcc-4.8.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
