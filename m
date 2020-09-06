From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 16:29:39 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/multipath-tools: new package
In-Reply-To: <20200906091943.11594-1-egorenar-dev@posteo.net>
References: <20200906091943.11594-1-egorenar-dev@posteo.net>
Message-ID: <20200906162939.73a97b84@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Sep 2020 11:19:43 +0200
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  ...ath-use-pkg-config-to-get-path-to-he.patch | 59 +++++++++++++++++++
>  ...bmpathpersist-depend-on-libmultipath.patch | 31 ++++++++++
>  ...3-fix-boolean-value-with-json-c-0.14.patch | 41 +++++++++++++
>  ...ools-Makefile-add-install-dependency.patch | 34 +++++++++++
>  ...ble-systemd-if-ENABLE_SYSTEMD-is-def.patch | 35 +++++++++++
>  package/multipath-tools/Config.in             | 31 ++++++++++
>  package/multipath-tools/S60multipathd         | 47 +++++++++++++++
>  package/multipath-tools/multipath-tools.hash  |  3 +
>  package/multipath-tools/multipath-tools.mk    | 34 +++++++++++
>  11 files changed, 317 insertions(+)
>  create mode 100644 package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
>  create mode 100644 package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch
>  create mode 100644 package/multipath-tools/0003-fix-boolean-value-with-json-c-0.14.patch
>  create mode 100644 package/multipath-tools/0004-multipath-tools-Makefile-add-install-dependency.patch
>  create mode 100644 package/multipath-tools/0005-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
>  create mode 100644 package/multipath-tools/Config.in
>  create mode 100644 package/multipath-tools/S60multipathd
>  create mode 100644 package/multipath-tools/multipath-tools.hash
>  create mode 100644 package/multipath-tools/multipath-tools.mk

Applied to master, thanks a lot for going through all those iterations!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
