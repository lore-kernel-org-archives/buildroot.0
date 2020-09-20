From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Sep 2020 16:30:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/vsftpd: renumber patches
Message-ID: <20200920143036.1430126-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 415765b5a8861f3b7e86e9786bf903a5a4d09e73 removed the second patch
without renumbering the remaining ones

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...{0003-fix-CVE-2015-1419.patch => 0002-fix-CVE-2015-1419.patch} | 0
 ...D-handler.patch => 0003-Prevent-hang-in-SIGCHLD-handler.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/vsftpd/{0003-fix-CVE-2015-1419.patch => 0002-fix-CVE-2015-1419.patch} (100%)
 rename package/vsftpd/{0004-Prevent-hang-in-SIGCHLD-handler.patch => 0003-Prevent-hang-in-SIGCHLD-handler.patch} (100%)

diff --git a/package/vsftpd/0003-fix-CVE-2015-1419.patch b/package/vsftpd/0002-fix-CVE-2015-1419.patch
similarity index 100%
rename from package/vsftpd/0003-fix-CVE-2015-1419.patch
rename to package/vsftpd/0002-fix-CVE-2015-1419.patch
diff --git a/package/vsftpd/0004-Prevent-hang-in-SIGCHLD-handler.patch b/package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch
similarity index 100%
rename from package/vsftpd/0004-Prevent-hang-in-SIGCHLD-handler.patch
rename to package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch
-- 
2.28.0
