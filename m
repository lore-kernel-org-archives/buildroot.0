From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Oct 2016 12:09:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/ejabberd: fix typo in hash file url
Message-ID: <20161009100931.25707-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ejabberd/ejabberd.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index ea85d1c..4284eec 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,4 +1,4 @@
-# From https://www.process-one.net/downloads/ejabberd/15.11/ejabberd-16.01.tgz.md5
+# From https://www.process-one.net/downloads/ejabberd/16.01/ejabberd-16.01.tgz.md5
 md5 5e525c25c8f04287217b8a9522d7c942 ejabberd-16.01.tgz
 # Locally computed
 sha256 e2cc479d5870539b2e6756690b227969c88a541d464d1fc6e1cbf7270ad7d681 ejabberd-16.01.tgz
-- 
2.9.3
