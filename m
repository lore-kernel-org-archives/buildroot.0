From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 18 Nov 2017 21:32:02 +0100
Subject: [Buildroot] [PATCH 1/1] libupnp: add LICENSE hash and DEVELOPERS
 entry
Message-ID: <20171118203202.29234-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                   | 1 +
 package/libupnp/libupnp.hash | 1 +
 2 files changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e9ee1e70a..fe04cee37 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -609,6 +609,7 @@ F:	package/gupnp-dlna/
 F:	package/gupnp-tools/
 F:	package/hiredis/
 F:	package/igd2-for-linux/
+F:	package/libupnp/
 F:	package/libupnp18/
 F:	package/minissdpd/
 F:	package/motion/
diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 10124618f..314c68e82 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	0bdfacb7fa8d99b78343b550800ff193264f92c66ef67852f87f042fd1a1ebbc	libupnp-1.6.22.tar.bz2
+sha256	0375955c8a79d6e8fa0792d45d00fc4e7710d7ac95bcbd27f9225a83f5c946fd	LICENSE
-- 
2.14.1
