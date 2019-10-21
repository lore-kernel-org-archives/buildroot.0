From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:17:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: bump version to 3.6.10
In-Reply-To: <20191020211532.3281-1-bernd.kuhls@t-online.de>
References: <20191020211532.3281-1-bernd.kuhls@t-online.de>
Message-ID: <20191021211732.11b4dd3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 23:15:32 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://lists.gnupg.org/pipermail/gnutls-help/2019-September/004574.html
> 
> Removed patch applied upstream, also removed autoreconf.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ..._get_cpuid_count-only-when-available.patch | 82 -------------------
>  package/gnutls/gnutls.hash                    |  4 +-
>  package/gnutls/gnutls.mk                      |  4 +-
>  3 files changed, 3 insertions(+), 87 deletions(-)
>  delete mode 100644 package/gnutls/0001-read_cpuid_vals-use-__get_cpuid_count-only-when-available.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
