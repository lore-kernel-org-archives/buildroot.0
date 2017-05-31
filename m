From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:25:31 +0200
Subject: [Buildroot] [git commit branch/next] package/tor: bump version to
	0.3.0.7
Message-ID: <20170531202534.8FADC8190F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf422099f719204945bc2cffa0a96e3570acb96b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 5b83aa4..bfdf055 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a3e512e93cb555601fd207d914d7c5fe981d66d6ebb5821ecdf5dea738c2fb14  tor-0.3.0.6.tar.gz
+sha256 9640c4448ef3cad7237c68ed6984e705db8fb2b9d6bb74c8815d01bb06527d02  tor-0.3.0.7.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index e6cb2b7..305f6bf 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.0.6
+TOR_VERSION = 0.3.0.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
