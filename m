From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 07 Aug 2013 19:34:15 +0200
Subject: [Buildroot] [PATCH 0 of 2] strongswan: fix some autobuild failures
Message-ID: <patchbomb.1375896855@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

strongswan suffers from several autobuild failures. This series addresses
one of them: 'no rule to make target libtls.la'. While looking at it, I also
saw a missing host-pkgconf dependency, although I did not see this in any of
the autobuilds I checked.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/strongswan/strongswan-0001-force-tls-when-needed.patch |  72 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 package/strongswan/strongswan.mk                               |   9 +++++++++
 2 files changed, 81 insertions(+), 0 deletions(-)
