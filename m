From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 10:48:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/suricata: bump to version 6.0.0
In-Reply-To: <20201010194850.1434998-1-fontaine.fabrice@gmail.com>
References: <20201010194850.1434998-1-fontaine.fabrice@gmail.com>
Message-ID: <20201025104830.314afbc2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 10 Oct 2020 21:48:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Refresh first patch
> - Drop second patch, not needed since
>   https://github.com/OISF/suricata/commit/5c725d50502b2a7a747fc04938937b8c6b733aac
> - Drop BR2_PACKAGE_GEOIP dependency as suricata switched to GeoIP2, see
>   https://github.com/OISF/suricata/commit/a291209e473a261546363f0d9051f1e3b82e699a
> - jansson is now a mandatory dependency, see
>   https://github.com/OISF/suricata/commit/e49c40428e1b9f7e5dcdb5857c3978d5cb859fd9
> - rustc is now a mandatory dependency, see
>   https://github.com/OISF/suricata/commit/75429bbe3ea3ff12a9e8e7e863a10ded91cb6de9
> 
> EOL date of 4.1 branch is December 31st, 2020.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ure-proper-shabang-on-python-scripts.patch | 12 ++++---
>  ...low-the-user-to-override-RUST_TARGET.patch | 35 +++++++++++++++++++
>  ...re.ac-fix-cross-compilation-with-lua.patch | 33 -----------------
>  package/suricata/Config.in                    |  4 +++
>  package/suricata/suricata.hash                |  2 +-
>  package/suricata/suricata.mk                  | 23 +++++-------
>  6 files changed, 55 insertions(+), 54 deletions(-)
>  create mode 100644 package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
>  delete mode 100644 package/suricata/0002-configure.ac-fix-cross-compilation-with-lua.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
