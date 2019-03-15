From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Mar 2019 15:56:13 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/tor: security
 bump to 0.3.4.11
Message-ID: <20190315145442.E3E1F8E758@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4d6d1f83de0be8b1e2e50c970b6fd7817df5cfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Release notes:
https://blog.torproject.org/new-releases-tor-0402-alpha-0358-03411-and-03312

Fixes CVE-2019-8955:
KIST can write above outbuf highwater mark
https://trac.torproject.org/projects/tor/ticket/29168

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 71aef25d79..d38fe4ccf8 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 1a171081f02b9a6ff9e28c0898defb7670e5bbb3bdbcaddfcf4e4304aedd164a  tor-0.3.4.9.tar.gz
+sha256 58c65dc7728fbf92e36c2d95f1f2cc9b82b6e5466d5a19c9524a176fd0148412  tor-0.3.4.11.tar.gz
 sha256 f9a4f724d8037711dde7d3f1d17094fb7d211545b3a3bbb1b03e769e13ca5608  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 0a7691d4c8..9e77de4ce9 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.4.9
+TOR_VERSION = 0.3.4.11
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
