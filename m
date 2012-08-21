From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:02:51 +0200
Subject: [Buildroot] [git commit] docs/manual: fix cross-reference
Message-ID: <20120821110311.B5F9A97206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=576aafbd280cf78096a50892638ddf343f2e4e54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
