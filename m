From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Mar 2014 22:48:01 +0100
Subject: [Buildroot] [git commit] website: Add a Google+ presence
Message-ID: <20140328214914.AAC9C9C3EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac59563764a790adb822863c7cd16c070506d585
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we use Google+ to share our news, this add a logo on the menu bar,
which links to the Buildroot profile.

[Peter: change link to Buildroot account]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/header.html      |    5 +++++
 docs/images/gplus.png |  Bin 0 -> 4760 bytes
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/docs/header.html b/docs/header.html
index f64869f..93a4d51 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -16,6 +16,10 @@
       .button_column{
         width: 430px;
       }
+      .gplus {
+        float:right;
+        margin: 10px 0 0;
+      }
     </style>
 
     <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
@@ -43,6 +47,7 @@
               <li><a href="/contribute.html">Contribute</a></li>
               <li><a href="/sponsors.html">Sponsors</a></li>
             </ul>
+            <a class="gplus" href="https://plus.google.com/100084591154899263420/posts"><img src="images/gplus.png" height="28" width="28"></a>
           </div><!--/.nav-collapse -->
         </div>
       </div>
diff --git a/docs/images/gplus.png b/docs/images/gplus.png
new file mode 100644
index 0000000..0ec57bb
Binary files /dev/null and b/docs/images/gplus.png differ
