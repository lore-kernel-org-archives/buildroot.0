From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Wed,  5 Jul 2017 20:25:27 +0530
Subject: [Buildroot] [PATCH 7/7] cxxtest: add hash for license file
In-Reply-To: <1499266527-11091-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1499266527-11091-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1499266527-11091-7-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
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
-- 
2.7.4
