From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Dec 2017 08:31:32 +0100
Subject: [Buildroot] [PATCH 1/3] package/libupnp18: added upstream sha1 hash
Message-ID: <20171214073134.28696-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libupnp18/libupnp18.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libupnp18/libupnp18.hash b/package/libupnp18/libupnp18.hash
index a5b5b074c9..dd59034cd3 100644
--- a/package/libupnp18/libupnp18.hash
+++ b/package/libupnp18/libupnp18.hash
@@ -1,3 +1,5 @@
+# From https://sourceforge.net/projects/pupnp/files/pupnp/libUPnP%201.8.3/libupnp-1.8.3.tar.bz2.sha1
+sha1 e7c28c24905ae972ff3277a7bdaa9b839f6c66b9  libupnp-1.8.3.tar.bz2
 # Locally computed:
 sha256	9afa0b09faa9ebd9e8a6425ddbfe8d1d856544c49b1f86fde221219e569a308d	libupnp-1.8.3.tar.bz2
 sha256	0375955c8a79d6e8fa0792d45d00fc4e7710d7ac95bcbd27f9225a83f5c946fd	LICENSE
-- 
2.11.0
