From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jan 2020 16:29:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/exim: bump version to 4.93.0.3
In-Reply-To: <20200104143813.2514491-1-bernd.kuhls@t-online.de>
References: <20200104143813.2514491-1-bernd.kuhls@t-online.de>
Message-ID: <20200104162939.75eb7a35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Jan 2020 15:38:13 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed 0004-Fix-uClibc-build.patch, committed upstream
> https://git.exim.org/exim.git/commitdiff/ec5bf0b83235d01ad0b2865d1819a603441f50f2
> 
> Renumbered remaining patches.
> 
> Added hashes provided by upstream.
> 
> Explicitly disabled DANE after upstream enabled it:
> https://git.exim.org/exim.git/commitdiff/59c0959a36649c4554bd0f18f2c2e74571ed41eb#patch3
> 
> Use new TLS options:
> https://git.exim.org/exim.git/commitdiff/01603eec64d42431f182b33008206facfc7f800e#patch1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...uild.patch => 0004-Fix-uClibc-build.patch} |  0
>  package/exim/0004-remove-libnsl.patch         | 37 -------------------
>  package/exim/exim.hash                        |  7 +++-
>  package/exim/exim.mk                          | 11 ++++--
>  4 files changed, 13 insertions(+), 42 deletions(-)
>  rename package/exim/{0005-Fix-uClibc-build.patch => 0004-Fix-uClibc-build.patch} (100%)
>  delete mode 100644 package/exim/0004-remove-libnsl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
