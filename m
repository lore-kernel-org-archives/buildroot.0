From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Aug 2012 23:58:55 +0200
Subject: [Buildroot] [PATCH] docs/manual: fix cross-reference
Message-ID: <1345327135-30445-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages.txt     |    1 +
 docs/manual/rebuilding-packages.txt |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index acbde0c..cb75f2d 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -1,5 +1,6 @@
 Adding new packages to Buildroot
 ================================
+[[adding-packages]]
 
 This section covers how new packages (userspace libraries or
 applications) can be integrated into Buildroot. It also shows how
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index f247dd0..fb6d696 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -29,7 +29,7 @@ by the different packages, so some understanding of the particular
 package is needed.
 
 For packages relying on Buildroot packages infrastructures (see
-xref:add-packages[this section] for details), the following stamp
+xref:adding-packages[this section] for details), the following stamp
 files are relevant:
 
 * +output/build/packagename-version/.stamp_configured+. If removed,
-- 
1.7.2.5
