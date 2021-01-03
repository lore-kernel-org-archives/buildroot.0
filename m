From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jan 2021 11:39:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to
 version 0.8.5
In-Reply-To: <20201121104412.28360-1-egorenar-dev@posteo.net>
References: <20201121104412.28360-1-egorenar-dev@posteo.net>
Message-ID: <20210103113922.206c44ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Nov 2020 11:44:12 +0100
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> Change github URL to https://github.com/opensvc/multipath-tools
> which offers proper releases.
> 
> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
> ---
>  ...ath-use-pkg-config-to-get-path-to-he.patch | 28 +++++++++----
>  ...le-systemd-if-ENABLE_SYSTEMD-is-def.patch} |  0
>  ...bmpathpersist-depend-on-libmultipath.patch | 31 --------------
>  ...3-fix-boolean-value-with-json-c-0.14.patch | 41 -------------------
>  ...ools-Makefile-add-install-dependency.patch | 34 ---------------
>  package/multipath-tools/multipath-tools.hash  |  2 +-
>  package/multipath-tools/multipath-tools.mk    |  4 +-
>  7 files changed, 22 insertions(+), 118 deletions(-)
>  rename package/multipath-tools/{0005-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch => 0002-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch} (100%)
>  delete mode 100644 package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch
>  delete mode 100644 package/multipath-tools/0003-fix-boolean-value-with-json-c-0.14.patch
>  delete mode 100644 package/multipath-tools/0004-multipath-tools-Makefile-add-install-dependency.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
