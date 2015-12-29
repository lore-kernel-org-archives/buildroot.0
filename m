From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 22:06:45 +0100
Subject: [Buildroot] [git commit] docs/website: fixing pre block indentation
Message-ID: <20151229210728.8C8AD826F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33771d6a2d422054bd41d593f129a8b5f5fe8534
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pre block should not be indented, this patch fixes wrong
indentation.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/website/download.html | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 46f601d..34b06bf 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -137,9 +137,9 @@
 		tree at any time so it is in sync with the latest and greatest by entering your
 		buildroot directory and running the command:
 
-		<pre>
-		  git pull
-		</pre>
+<pre>
+git pull
+</pre>
 
 		Because you've only been granted anonymous access to the tree, you won't be
 		able to push your changes to the repo. Changes can instead be submitted for
