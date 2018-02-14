From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 14 Feb 2018 00:04:55 -0500
Subject: [Buildroot] [PATCH 0/3] Config.in{,host}: check-package pass
Message-ID: <20180214050458.32281-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here are some fixes about warning reported by check-package.

Regards,
Ga?l PORTAY (3):
  package/*/Config.in.host: fix help text check-package warnings
  gconf: Config.in: fix help text wrapping
  pure-ftpd: Config.in: fix help text wrapping

 package/gconf/Config.in                  | 6 +++---
 package/mtools/Config.in.host            | 8 ++++----
 package/omap-u-boot-utils/Config.in.host | 4 ++--
 package/pkgconf/Config.in.host           | 9 +++++----
 package/pure-ftpd/Config.in              | 4 ++--
 package/pwgen/Config.in.host             | 4 ++--
 package/qemu/Config.in.host              | 3 ++-
 package/tegrarcm/Config.in.host          | 4 ++--
 8 files changed, 22 insertions(+), 20 deletions(-)

-- 
2.15.1
