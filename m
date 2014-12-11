From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 11 Dec 2014 11:53:20 +0000
Subject: [Buildroot] [PATCH 1/2] libsvgtiny: rename patches to follow the
	new name convention
Message-ID: <1418298801-47799-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2: this patch did not exist in v1

 ...ntfs.patch => 0001-disable-debug-printfs.patch} |    0
 ...e-builddir.patch => 0002-create-builddir.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/libsvgtiny/{libsvgtiny-01-disable-debug-printfs.patch => 0001-disable-debug-printfs.patch} (100%)
 rename package/libsvgtiny/{libsvgtiny-02-create-builddir.patch => 0002-create-builddir.patch} (100%)

diff --git a/package/libsvgtiny/libsvgtiny-01-disable-debug-printfs.patch b/package/libsvgtiny/0001-disable-debug-printfs.patch
similarity index 100%
rename from package/libsvgtiny/libsvgtiny-01-disable-debug-printfs.patch
rename to package/libsvgtiny/0001-disable-debug-printfs.patch
diff --git a/package/libsvgtiny/libsvgtiny-02-create-builddir.patch b/package/libsvgtiny/0002-create-builddir.patch
similarity index 100%
rename from package/libsvgtiny/libsvgtiny-02-create-builddir.patch
rename to package/libsvgtiny/0002-create-builddir.patch
-- 
1.7.1
