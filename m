From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 21:54:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpagekite: bump to version
 0.91.190530
In-Reply-To: <20191005160805.20068-1-fontaine.fabrice@gmail.com>
References: <20191005160805.20068-1-fontaine.fabrice@gmail.com>
Message-ID: <20191005215447.40a2fab2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Oct 2019 18:08:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove all patches (already in version)
> - In order for the libpagekite version to match what is given by
>   release-monitoring.org, the 'v' prefix should be encoded in
>   LIBPAGEKITE_SITE and not LIBPAGEKITE_VERSION.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-configure.ac-fix-handling-of-with.patch |  76 ----------
>  ...-use-AS_HELP_STRING-for-with-openssl.patch |  28 ----
>  ...figure.ac-use-pkg-config-for-openssl.patch | 137 ------------------
>  package/libpagekite/libpagekite.hash          |   2 +-
>  package/libpagekite/libpagekite.mk            |   5 +-
>  5 files changed, 3 insertions(+), 245 deletions(-)
>  delete mode 100644 package/libpagekite/0001-configure.ac-fix-handling-of-with.patch
>  delete mode 100644 package/libpagekite/0002-configure.ac-use-AS_HELP_STRING-for-with-openssl.patch
>  delete mode 100644 package/libpagekite/0003-configure.ac-use-pkg-config-for-openssl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
