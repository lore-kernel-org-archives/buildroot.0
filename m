From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Mar 2019 09:40:46 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/sqlcipher: bump to version
 4.0.1
In-Reply-To: <20190303093000.26921-1-fontaine.fabrice@gmail.com>
References: <20190303093000.26921-1-fontaine.fabrice@gmail.com>
Message-ID: <20190308094046.0a31ffbd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 Mar 2019 10:30:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove three patches (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Support-OpenSSL-1.1.0-and-prior.patch     | 97 ----------------------
>  ...SL-init-and-cleanup-routines-on-versions-.patch | 42 ----------
>  ...3-correct-compliation-under-openssl-1.1.x.patch | 48 -----------
>  package/sqlcipher/sqlcipher.hash                   |  2 +-
>  package/sqlcipher/sqlcipher.mk                     |  2 +-
>  5 files changed, 2 insertions(+), 189 deletions(-)
>  delete mode 100644 package/sqlcipher/0001-Support-OpenSSL-1.1.0-and-prior.patch
>  delete mode 100644 package/sqlcipher/0002-Guard-OpenSSL-init-and-cleanup-routines-on-versions-.patch
>  delete mode 100644 package/sqlcipher/0003-correct-compliation-under-openssl-1.1.x.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
