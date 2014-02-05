From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 10:43:59 +0100
Subject: [Buildroot] [PATCH 0 of 5 v3] infra: remove FOO_DIR_PREFIX,
 4th param of pkg infras, pkgparentdir
Message-ID: <patchbomb.1391593439@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This patch series removes a number of unused variables and helper functions.
It is a v3 of patch http://patchwork.ozlabs.org/patch/290254/
('infra: remove usage of pkgparentdir in favor of pkgdir') but simplifies
the code even more, after discussion on the Buildroot Developer Days at
FOSDEM 2014 and further input of Arnout.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-autotools.mk |  13 ++++++-------
 package/pkg-cmake.mk     |  13 ++++++-------
 package/pkg-generic.mk   |  29 ++++++++++++++---------------
 package/pkg-luarocks.mk  |   7 +++----
 package/pkg-python.mk    |  17 ++++++++---------
 package/pkg-utils.mk     |   7 ++-----
 6 files changed, 39 insertions(+), 47 deletions(-)
