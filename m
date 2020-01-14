From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2020 22:56:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/udftools: bump to version 2.2
In-Reply-To: <20200113204016.1132052-1-fontaine.fabrice@gmail.com>
References: <20200113204016.1132052-1-fontaine.fabrice@gmail.com>
Message-ID: <20200114225604.426180c0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jan 2020 21:40:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop all patches (already in version) and so autoreconf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...figure-Use-AS_IF-macro-for-C99-check.patch | 27 -------
>  ...Allow-to-build-udftools-without-udev.patch | 49 -----------
>  ...ect-readline-via-pkg-config-when-pos.patch | 81 -------------------
>  package/udftools/udftools.hash                |  2 +-
>  package/udftools/udftools.mk                  |  3 +-
>  5 files changed, 2 insertions(+), 160 deletions(-)
>  delete mode 100644 package/udftools/0001-configure-Use-AS_IF-macro-for-C99-check.patch
>  delete mode 100644 package/udftools/0002-all-Allow-to-build-udftools-without-udev.patch
>  delete mode 100644 package/udftools/0003-configure.ac-detect-readline-via-pkg-config-when-pos.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
