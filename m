From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Sep 2018 15:28:17 +0200
Subject: [Buildroot] [PATCH 2/2] package/expedite: bump to the latest version
In-Reply-To: <20180929132817.30011-1-romain.naour@gmail.com>
References: <20180929132817.30011-1-romain.naour@gmail.com>
Message-ID: <20180929132817.30011-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While at it add license file hash.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---

From the latest commit [1] "this is a dead project".
This does not encourage to keep expedite in Buildroot, should I remove it?
This question was asked on the efl mailing list. I'm waiting for a reply.

[1] https://git.enlightenment.org/tools/expedite.git/commit/?id=27e5e02370799b4e9246fe6dde893207d1ac3f3b
---
 package/expedite/expedite.hash | 3 ++-
 package/expedite/expedite.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/expedite/expedite.hash b/package/expedite/expedite.hash
index 828ee0553b..d813cb38c3 100644
--- a/package/expedite/expedite.hash
+++ b/package/expedite/expedite.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256 56e1dbd9826d932f0ef72a10dfdf32b6e0f680ab6830f8a8cfc60644ac69dbf1 expedite-e7b11dd328d9db82b49cde795944a721beaf0112.tar.gz
+sha256 5f621a3cb70fae943893e256722cc7f7b0c4357035da7cc3cbbbb83e4ec1eb9a expedite-6a69955e71a00a720e1b0a9bc7b64dd3dd5673db.tar.gz
+sha256 0f024d9d9ddd18f94a4800d72e72d2ca198e9479c02b21afb9cacc2923ef2f2b COPYING
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index 6bd4b007ba..fbcc4b5675 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPEDITE_VERSION = e7b11dd328d9db82b49cde795944a721beaf0112
+EXPEDITE_VERSION = 6a69955e71a00a720e1b0a9bc7b64dd3dd5673db
 EXPEDITE_SITE = http://git.enlightenment.org/tools/expedite.git
 EXPEDITE_SITE_METHOD = git
 EXPEDITE_LICENSE = BSD-2-Clause
-- 
2.14.4
