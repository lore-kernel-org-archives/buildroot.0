From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  7 Jan 2020 13:18:02 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/ejabberd: add hash for license
 file
In-Reply-To: <20200107114801.25624-2-johan.oudinet@gmail.com>
References: <20200107114801.25624-2-johan.oudinet@gmail.com>
Message-ID: <20200107121802.30730-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/ejabberd/ejabberd.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index 277ae06107..145e7401a9 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 18ddf61af22fc9b59f8afc6835aae2aee9896eb91cc1030056d6bca6a1fa40d2 ejabberd-19.09.1.tgz
+sha256 469bb8cfa3ef22c102875ff31932450c075e6908ff3f7d36893485c0c30898eb COPYING
-- 
2.20.1
