From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 23:10:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/libraw: security bump to
 version 0.20.0
In-Reply-To: <20200906125351.2869468-1-fontaine.fabrice@gmail.com>
References: <20200906125351.2869468-1-fontaine.fabrice@gmail.com>
Message-ID: <20200907231040.6d235314@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Sep 2020 14:53:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fix CVE-2020-15503: LibRaw before 0.20-RC1 lacks a thumbnail size
>   range check. This affects decoders/unpack_thumb.cpp,
>   postprocessing/mem_image.cpp, and utils/thumb_utils.cpp. For example,
>   malloc(sizeof(libraw_processed_image_t)+T.tlength) occurs without
>   validating T.tlength.
> 
> - zlib is an optional dependency since
>   https://github.com/LibRaw/LibRaw/commit/b63f017b063edb5e7091e3952ee20cb4d002edbe
> 
> Also update indentation in hash file (two spaces) as well as README.md
> hash, no license changes:
>  - https://github.com/LibRaw/LibRaw/commit/d1975cb0e055d2bfe58c9d845c9a3e57c346a2f9
>  - https://github.com/LibRaw/LibRaw/commit/d38361b76e1a405a25b11165a1ee5495fc899246
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libraw/libraw.hash | 8 ++++----
>  package/libraw/libraw.mk   | 9 ++++++++-
>  2 files changed, 12 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
