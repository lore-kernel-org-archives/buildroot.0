From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:35:29 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] package/tor: security
 bump to version 0.3.1.9
Message-ID: <20171227094030.0958C83563@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92312b2ea69929106ac25863973c3f3f9665ec1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Release notes:
https://blog.torproject.org/new-stable-tor-releases-security-fixes-0319-03013-02914-02817-02516

Fixes CVE-2017-8819, CVE-2017-8820, CVE-2017-8821, CVE-2017-8822
and CVE-2017-8823.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit a22ccc846734cb51a8b51097727e9e89699f3052)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index cf8841a..08ab61e 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 7df6298860a59f410ff8829cf7905a50c8b3a9094d51a8553603b401e4b5b1a1  tor-0.3.1.8.tar.gz
+sha256 6e1b04f7890e782fd56014a0de5075e4ab29b52a35d8bca1f6b80c93f58f3d26  tor-0.3.1.9.tar.gz
 sha256 f9a4f724d8037711dde7d3f1d17094fb7d211545b3a3bbb1b03e769e13ca5608  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index c38ed90..6a42dbc 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.1.8
+TOR_VERSION = 0.3.1.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
