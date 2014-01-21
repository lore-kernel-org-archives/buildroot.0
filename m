From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2014 23:41:16 +0100
Subject: [Buildroot] [git commit] mysql: rename the patches so they have a
	number
Message-ID: <20140121224154.498DA9A355@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2b2ecb691ab7e8cd7e88514483c2a966389c6f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rename patches to add sequence numbers

Signed-off-by: Marcelo Guti??rrez <kuyurix@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...check.patch => mysql-0000-ac_cache_check.patch} |    0
 ...h => mysql-0001-configure-ps-cache-check.patch} |    0
 ...tch => mysql-0002-use-new-readline-iface.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/mysql/mysql-ac_cache_check.patch b/package/mysql/mysql-0000-ac_cache_check.patch
similarity index 100%
rename from package/mysql/mysql-ac_cache_check.patch
rename to package/mysql/mysql-0000-ac_cache_check.patch
diff --git a/package/mysql/mysql-configure-ps-cache-check.patch b/package/mysql/mysql-0001-configure-ps-cache-check.patch
similarity index 100%
rename from package/mysql/mysql-configure-ps-cache-check.patch
rename to package/mysql/mysql-0001-configure-ps-cache-check.patch
diff --git a/package/mysql/mysql-use-new-readline-iface.patch b/package/mysql/mysql-0002-use-new-readline-iface.patch
similarity index 100%
rename from package/mysql/mysql-use-new-readline-iface.patch
rename to package/mysql/mysql-0002-use-new-readline-iface.patch
