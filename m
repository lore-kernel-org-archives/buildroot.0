From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:13:35 +0100
Subject: [Buildroot] [git commit] libupnp: add LICENSE hash and DEVELOPERS
 entry
Message-ID: <20171122210623.D045081499@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bede3a11f476c440f015bca214efffdb7ad601c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                   | 1 +
 package/libupnp/libupnp.hash | 1 +
 2 files changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bb81a19..73b1424 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -608,6 +608,7 @@ F:	package/gupnp-dlna/
 F:	package/gupnp-tools/
 F:	package/hiredis/
 F:	package/igd2-for-linux/
+F:	package/libupnp/
 F:	package/minissdpd/
 F:	package/motion/
 F:	package/tinycbor/
diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 1012461..314c68e 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	0bdfacb7fa8d99b78343b550800ff193264f92c66ef67852f87f042fd1a1ebbc	libupnp-1.6.22.tar.bz2
+sha256	0375955c8a79d6e8fa0792d45d00fc4e7710d7ac95bcbd27f9225a83f5c946fd	LICENSE
