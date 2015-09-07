From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Sep 2015 14:08:34 +0100
Subject: [Buildroot] [PATCH] docs/website: add a space between attributes
Message-ID: <1441631314-47198-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Error highlighted by the W3 HTML validator:

Error: No space between attributes.
At line 71, column 64
e="width:100%;"href="/download

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 docs/website/index.html |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/website/index.html b/docs/website/index.html
index 36075bc..c6882fb 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -19,7 +19,7 @@
           <a class="btn btn-primary btn-lg" style="width:100%;" href="/about.html"><span class="glyphicon glyphicon-info-sign"></span> Learn more ??</a>
           </div>
           <div class="col-sm-6" style="margin-top:1em; padding-left:0px;">
-          <a class="btn btn-primary btn-lg" style="width:100%;"href="/download.html"><span class="glyphicon glyphicon-cloud-download"></span> Download ??</a>
+          <a class="btn btn-primary btn-lg" style="width:100%;" href="/download.html"><span class="glyphicon glyphicon-cloud-download"></span> Download ??</a>
           </div>
         </div>
       </div>
-- 
1.7.1
