From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Nov 2010 10:09:01 +0100
Subject: [Buildroot] [PATCH 1/3] documentation: introduce a FAQ section
In-Reply-To: <cover.1290762533.git.thomas.petazzoni@free-electrons.com>
References: <cover.1290762533.git.thomas.petazzoni@free-electrons.com>
Message-ID: <42ddff55d4ab08defc25d8f59a1d41d536ae5fad.1290762533.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 1444612..d9df668 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -32,6 +32,7 @@
       <li><a href="#downloaded_packages">Location of downloaded packages</a></li>
       <li><a href="#add_packages">Adding new packages to Buildroot</a></li>
       <li><a href="#board_support">Creating your own board support</a></li>
+      <li><a href="#faq">Frequently asked questions</a></li>
       <li><a href="#links">Resources</a></li>
     </ul>
 
@@ -1593,6 +1594,11 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     <p>If you package software that might be useful for other people, don't
     forget to send a patch to Buildroot developers!</p>
 
+    <h2 id="faq">Frequently asked questions</h2>
+
+    <ul>
+    </ul>
+
     <h2 id="links">Resources</h2>
 
     <p>To learn more about Buildroot you can visit these websites:</p>
-- 
1.7.0.4
