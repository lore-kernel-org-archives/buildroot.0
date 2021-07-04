From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Jul 2021 11:09:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/blktrace: bump to version 1.3.0
In-Reply-To: <20210703220424.2033844-1-fontaine.fabrice@gmail.com>
References: <20210703220424.2033844-1-fontaine.fabrice@gmail.com>
Message-ID: <20210704110950.1a3735c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Jul 2021 00:04:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use tar.bz2 tarball
> - Update indentation in hash file (two spaces)
> - Drop patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...devno-use-PATH_MAX-to-avoid-overflow.patch | 146 ------------------
>  package/blktrace/blktrace.hash                |   6 +-
>  package/blktrace/blktrace.mk                  |   6 +-
>  3 files changed, 5 insertions(+), 153 deletions(-)
>  delete mode 100644 package/blktrace/0001-btt-make-device-devno-use-PATH_MAX-to-avoid-overflow.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
