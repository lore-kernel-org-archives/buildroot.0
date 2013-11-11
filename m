From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Nov 2013 12:53:10 +0100
Subject: [Buildroot] [PATCH 0 of 2] infra: remove pkgparentdir
Message-ID: <patchbomb.1384170790@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Following Arnout's suggestion, this patch series removes the pkgparentdir
function in favor of pkgdir.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---

 package/dhrystone/dhrystone.mk |   2 +-
 package/pkg-autotools.mk       |   6 +++---
 package/pkg-cmake.mk           |   6 +++---
 package/pkg-generic.mk         |  10 +++++-----
 package/pkg-utils.mk           |   1 -
 5 files changed, 12 insertions(+), 13 deletions(-)
