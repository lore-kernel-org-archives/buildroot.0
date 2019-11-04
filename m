From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 21:59:23 +0100
Subject: [Buildroot] [PATCH] package/libupnp18: bump to version 1.8.5
In-Reply-To: <20191104140151.14746-1-joerg.krause@embedded.rocks>
References: <20191104140151.14746-1-joerg.krause@embedded.rocks>
Message-ID: <20191104215923.3b44bd96@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Nov 2019 15:01:50 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Drop patches included in new version. No need for autoreconf anymore.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...-configure.ac-fix-build-with-openssl.patch | 51 -------------------
>  ...tach-detached-thread-the-result-is-u.patch | 39 --------------
>  package/libupnp18/libupnp18.hash              |  6 +--
>  package/libupnp18/libupnp18.mk                |  4 +-
>  4 files changed, 4 insertions(+), 96 deletions(-)
>  delete mode 100644 package/libupnp18/0001-configure.ac-fix-build-with-openssl.patch
>  delete mode 100644 package/libupnp18/0002-Do-not-try-to-detach-detached-thread-the-result-is-u.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
