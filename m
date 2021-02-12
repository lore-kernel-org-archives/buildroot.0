From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Feb 2021 22:15:05 +0100
Subject: [Buildroot] [git commit] docs/website: mention Bootlin Buildroot
 training courses
Message-ID: <20210212205725.563AF8160D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6593eb22f3f22ea5cd32f2d0927e42f335e19197
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our documentation page already mentions the open-source and freely
available training materials from Bootlin on Buildroot.

It turns out that we now have online training courses accessible to
public registration, which makes them accessible to a wider
audience. It probably makes sense to mention them alongside the
training materials.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
