From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 18:10:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvorbis: bump version to 1.3.7
In-Reply-To: <20200719053328.8698-1-bernd.kuhls@t-online.de>
References: <20200719053328.8698-1-bernd.kuhls@t-online.de>
Message-ID: <20200720181045.2a133c8a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Jul 2020 07:33:28 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patches which were applied upstream.
> 
> Reformatted hashes,
> 
> Updated license hash after copyright year update:
> https://gitlab.xiph.org/xiph/vorbis/-/commit/eb40ca5fbd0c60d8bd1fd33be07f02defc21e5d7
> 
> Switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ounds-check-on-very-low-sample-rates.patch | 31 -------------------
>  ...ty-check-number-of-channels-in-setup.patch | 28 -----------------
>  package/libvorbis/libvorbis.hash              |  4 +--
>  package/libvorbis/libvorbis.mk                | 10 ++----
>  4 files changed, 4 insertions(+), 69 deletions(-)
>  delete mode 100644 package/libvorbis/0001-CVE-2017-14160-fix-bounds-check-on-very-low-sample-rates.patch
>  delete mode 100644 package/libvorbis/0002-Sanity-check-number-of-channels-in-setup.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
