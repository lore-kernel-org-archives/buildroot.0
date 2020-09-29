From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 20:35:02 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/vsftpd: renumber
 patches
Message-ID: <20200929185628.32CF78E42A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ee7b3a126c1a249afbc2f005aca686954a5bf94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Commit 415765b5a8861f3b7e86e9786bf903a5a4d09e73 removed the second patch
without renumbering the remaining ones

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cd847f0986580c0ca4263ce6ae2cc57d26275820)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../vsftpd/{0003-fix-CVE-2015-1419.patch => 0002-fix-CVE-2015-1419.patch} | 0
 ...n-SIGCHLD-handler.patch => 0003-Prevent-hang-in-SIGCHLD-handler.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/0003-fix-CVE-2015-1419.patch b/package/vsftpd/0002-fix-CVE-2015-1419.patch
similarity index 100%
rename from package/vsftpd/0003-fix-CVE-2015-1419.patch
rename to package/vsftpd/0002-fix-CVE-2015-1419.patch
diff --git a/package/vsftpd/0004-Prevent-hang-in-SIGCHLD-handler.patch b/package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch
similarity index 100%
rename from package/vsftpd/0004-Prevent-hang-in-SIGCHLD-handler.patch
rename to package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch
