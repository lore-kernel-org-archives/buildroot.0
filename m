From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 23:14:42 +0200
Subject: [Buildroot] [git commit] package/harfbuzz: bump to version 2.8.2
Message-ID: <20210715204111.EBC589103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=c2465d52cc1068947e2bd2c8dd081097c581206d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the COPYING file is updated due to the following changes:

 Copyright ?? 2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020  Google, Inc.
 Copyright ?? 2018,2019,2020  Ebrahim Byagowi
-Copyright ?? 2019,2020  Facebook, Inc.
+Copyright ?? 2019,2020  Facebook, Inc.
 Copyright ?? 2012  Mozilla Foundation
 Copyright ?? 2011  Codethink Limited
 Copyright ?? 2008,2010  Nokia Corporation and/or its subsidiary(-ies)
 Copyright ?? 2009  Keith Stribley
 Copyright ?? 2009  Martin Hosken and SIL International
 Copyright ?? 2007  Chris Wilson
-Copyright ?? 2006  Behdad Esfahbod
+Copyright ?? 2005,2006,2020,2021  Behdad Esfahbod
 Copyright ?? 2005  David Turner
 Copyright ?? 2004,2007,2008,2009,2010  Red Hat, Inc.
 Copyright ?? 1998-2004  David Turner and Werner Lemberg

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index ad81b34fd6..774b3104a5 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4124f663ec4bf4e294d9cf230668370b4249a48ff34deaf0f06e8fc82d891300  harfbuzz-2.8.1.tar.xz
-sha256  beb3f017ceb41387667f78237a7cecf84defa0ed257c505894663d6a9f13211b  COPYING
+sha256  d58461395ce28b9dc03903254374dd70c38c8c28c5046db123c08f7ab9417be7  harfbuzz-2.8.2.tar.xz
+sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 60cc8b7247..f327a95eb6 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.8.1
+HARFBUZZ_VERSION = 2.8.2
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
