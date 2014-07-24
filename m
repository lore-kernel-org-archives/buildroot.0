From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Jul 2014 20:57:52 +0200
Subject: [Buildroot] [PATCH 0 of 2] kconfig-package: add documentation
Message-ID: <patchbomb.1406228272@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This small series accompanies the previously sent series introducing a
kconfig-package infrastructure. It provides documentation both as comments
in the pkg-kconfig.mk file, and in the manual.

Depending on the feedback received on the previous series, this
documentation may need revising.

At the moment of a resend, I will merge two series in one.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-kconfig.txt |  54 +++++++++++++++++++++++++++
 docs/manual/adding-packages.txt         |   2 +
 package/pkg-kconfig.mk                  |  48 ++++++++++++++++++++++++++-
 3 files changed, 103 insertions(+), 1 deletions(-)
