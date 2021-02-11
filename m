From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Feb 2021 16:05:01 +0100
Subject: [Buildroot] [PATCH] docs/website: mention Bootlin Buildroot
 training courses
Message-ID: <20210211150502.2784827-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our documentation page already mentions the open-source and freely
available training materials from Bootlin on Buildroot.

It turns out that we now have online training courses accessible to
public registration, which makes them accessible to a wider
audience. It probably makes sense to mention them alongside the
training materials.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/docs.html | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/website/docs.html b/docs/website/docs.html
index 9ef202ff9d..c619c16fa6 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -106,6 +106,18 @@
 	      </ul>
 	    </div>
 	  </div>
+
+	  <div class="panel panel-default">
+	    <div class="panel-heading">Public training course</div>
+	    <div class="panel-body">
+	      The next online public training course on Buildroot
+	      organized
+	      by <a href="https://www.bootlin.com">Bootlin</a> will
+	      take place on March 8-11, 2021, with Thomas Petazzoni as
+	      trainer. <a href="https://bootlin.com/training/buildroot/">Infos</a>
+	      and <a href="https://www.eventbrite.fr/e/bootlin-embedded-linux-development-with-buildroot-training-seminar-tickets-108855638144">registration</a>.
+	    </div>
+	  </div>
 	</div>
       </div>
     </div>
-- 
2.29.2
