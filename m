From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jul 2017 22:08:43 +0200
Subject: [Buildroot] [git commit] cxxtest: add hash for license file
Message-ID: <20170705200929.752307FE10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e5659fff89b44ea361a77f4703e446e52a71647
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cxxtest/cxxtest.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cxxtest/cxxtest.hash b/package/cxxtest/cxxtest.hash
index f552e80..be2cbd3 100644
--- a/package/cxxtest/cxxtest.hash
+++ b/package/cxxtest/cxxtest.hash
@@ -1,2 +1,5 @@
 # Locally computed:
 sha256	1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f4895cf7d8	cxxtest-4.4.tar.gz
+
+# Hash for license file:
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
