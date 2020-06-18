From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:40:02 +0200
Subject: [Buildroot] [PATCH] package/fastd: bump to v19
In-Reply-To: <20200611192504.4058-1-post@lespocky.de>
References: <20200611192504.4058-1-post@lespocky.de>
Message-ID: <20200618224002.4da2ed12@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Jun 2020 21:25:04 +0200
Alexander Dahl <post@lespocky.de> wrote:

> Maintenance release, most important is OpenSSL 1.1+ support. See full
> release notes for details:
> 
> https://fastd.readthedocs.io/en/stable/releases/v19.html
> 
> Two patches went upstream.  The last remaining patch was not touched,
> LTO might not work as expected, but upstream dropped CMake in favour of
> the meson build system after v19, so it seemed not worth the effort.
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>  ...akeList-do-not-overwrite-module-path.patch |  56 -------
>  ...emove-aes128-ctr-NaCl-implementation.patch | 137 ------------------
>  package/fastd/fastd.hash                      |   4 +-
>  package/fastd/fastd.mk                        |   4 +-
>  4 files changed, 3 insertions(+), 198 deletions(-)
>  delete mode 100644 package/fastd/0002-CMakeList-do-not-overwrite-module-path.patch
>  delete mode 100644 package/fastd/0003-cipher-remove-aes128-ctr-NaCl-implementation.patch

You had forgotten to update the hash of the license file (and explain
why it needs to be updated). I fixed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
