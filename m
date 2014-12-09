From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 20:49:23 +0100
Subject: [Buildroot] [git commit] website: Remove debug message
Message-ID: <20141209195104.2356A80167@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36c12e82038506563a61f4eb5b99d2ce697fd6cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/js/buildroot.js |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/docs/js/buildroot.js b/docs/js/buildroot.js
index 03c3968..6e0d97a 100644
--- a/docs/js/buildroot.js
+++ b/docs/js/buildroot.js
@@ -28,7 +28,6 @@ function load_activity(feedurl, divid) {
         for (var i = 0; i < empty; i++) {
           container.appendChild(document.createElement("p"));
         }
-        console.log(loaded);
       }
     });
 }
