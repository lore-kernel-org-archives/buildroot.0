From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 18 Oct 2013 22:31:32 +0200
Subject: [Buildroot] [PATCH 08/12] manual: update get-involved section
In-Reply-To: <cover.1382127504.git.s.martin49@gmail.com>
References: <cover.1382127504.git.s.martin49@gmail.com>
Message-ID: <77c7aa6b747b29c2bf0973bf5a80697cf1b8fa4a.1382127504.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* add events from the html page to the list
* add "Buildroot material" section. This new section references material
  (video, slides, posters, etc) used during presentations about Buildroot.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Let me know if I miss some events, or if you have some unreferenced
material urls or url fixes.

TIA,

changes v1 -> v2:
- misc. typos (ThomasDS)
- minor rewording (ThomasDS, Arnout and Ryan)

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/get-involved.txt | 162 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 152 insertions(+), 10 deletions(-)

diff --git a/docs/manual/get-involved.txt b/docs/manual/get-involved.txt
index 9e492e6..4be73f6 100644
--- a/docs/manual/get-involved.txt
+++ b/docs/manual/get-involved.txt
@@ -117,20 +117,162 @@ Currently, this page is mainly used as a _todo-list_.
 Events
 ------
 
-Buildroot Developer Days aside FOSDEM 2012 (February 3, 2012 - Brussels)
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Upcoming events
+~~~~~~~~~~~~~~~
+
+* Buildroot Developer Days
+  co-located with ELC-E 2013 (October 26-27, 2013 - Edinburgh, UK)
++
+Announcement and draft agenda of the event can also be found on:
++
+** http://lists.busybox.net/pipermail/buildroot/2013-May/072645.html[]
+** http://lists.busybox.net/pipermail/buildroot/2013-August/076560.html[]
+** http://elinux.org/Buildroot:DeveloperDaysELCE2013[]
+
+Latest events
+~~~~~~~~~~~~~
+
+* Lightning talks about 'Build system and Buildroot'
+  at Kernel Recipes 2013 (September 24-25, 2013 - Paris, France)
+
+* GSoC participation (Summer 2013)
++
+For the fisrt time of its life, Buildroot will participate to the
+Google Summer of Code 2013, by mentoring one student.
++
+This GSoC will mainly deal with improving support for ARM SoC
+multimedia features.
++
+** GSoC topic ideas: http://elinux.org/Buildroot:GSoC2013Ideas[]
+** GSoC project presentation: http://www.google-melange.com/gsoc/org/google/gsoc2013/buildroot[]
+
+* Buildroot technical showcase
+  at ELC 2013 (February 20-21, 2013 - San Francisco, US)
++
+** Poster: http://free-electrons.com/~thomas/pub/buildroot-poster.png[]
+** Slides: http://free-electrons.com/~thomas/pub/buildroot-slides.pdf[]
+
+* Buildroot Developer Days
+  co-located with FOSDEM 2013 (February 4-5, 2012 - Brussels, Belgium)
++
+A report from the recent Buildroot Developers Meeting is now
+http://lists.busybox.net/pipermail/buildroot/2013-February/067105.html[available].
++
+http://emlinews.net[Embedded Linux News] also has a
+http://www.emlinews.net/2013/02/buildroot-developers-meeting-report[writeup
+about the event], including photos.
++
+Announcement and report of the event can also be found on the
+http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013[related Wiki page].
++
+Once again, thanks to all the participants and to http://www.google.com[Google]
+for sponsoring the event.
+
+* Buildroot Developer Days
+  co-located with ELC-E 2012 (November 3-4, 2012 - Barcelona, Spain)
++
+A report from the recent _Buildroot Developer Days_ meeting in
+Barcelona, Spain is now
+http://lists.busybox.net/pipermail/buildroot/2012-November/061558.html[available].
++
+Many thanks to all the participants, and a special thanks to
+Arnout Vandecappelle from http://mind.be[mind] for taking notes and
+Thomas Petazzoni from http://free-electrons.com[Free Electrons] for
+handling all the practical arrangements, and naturally our sponsors,
+http://www.fluendo.com[Fluendo] and http://www.synopsys.com[Synopsis].
++
+Announcement, report and draft agenda of the event can also be found
+on:
++
+** http://elinux.org/Buildroot:DeveloperDaysELCE2012[]
+** http://elinux.org/Buildroot#Buildroot_Developers_Meeting.2C_3-4_November_2012.2C_Barcelona_Spain[]
+
+* Buildroot presentation
+  at LSM 2012 (July 12-14, 2012 - Geneva, Switzerland)
++
+** Announcement: http://lists.busybox.net/pipermail/buildroot/2012-May/053845.html[]
+
+* Buildroot presentation
+  at ELC 2012 (February 15-17, 2012 - San Francisco, US)
++
+** Slides: http://elinux.org/images/9/9e/Buildroot2.pdf[]
+** Video: http://video.linux.com/videos/buildroot-a-nice-simple-and-efficient-embedded-linux-build-system[]
+
+* Buildroot Developer Days
+  co-located with FOSDEM 2012 (February 3, 2012 - Brussels, Belgium)
++
+** Announcement:
+*** http://lists.busybox.net/pipermail/buildroot/2012-January/049340.html[]
+*** http://free-electrons.com/blog/bdd-2012-brussels[]
+** Report: http://lists.busybox.net/pipermail/buildroot/2012-February/050371.html[]
+
+* Buildroot presentation
+  at ELC-E 2011 (October 26-28, 2011 - Prague, Czech)
++
+** Slides: http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf[]
+** Video:
+http://free-electrons.com/pub/video/2011/elce/elce-2011-petazzoni-buildroot-for-real-project.webm[full HD],
+ http://free-electrons.com/pub/video/2011/elce/elce-2011-petazzoni-buildroot-for-real-project-450p.webm[450x800]
+
+* Buildroot Developer Day
+  co-located with ELC-E 2010 (October 29, 2010 - Cambridge, UK)
++
+** Announcement: http://lists.busybox.net/pipermail/buildroot/2010-September/037930.html[]
+
+* Buildroot presentation
+  at FOSDEM 2010 (May 2, 2010 - Brussels, Belgium)
++
+** Presentation: http://fosdem.org/2010/schedule/events/emb_cross_build[Build Systems:
+Present & Future]
+** Slides: http://send-patches.org/news/20100211-1-FOSDEM-Crossdev-Workshop.pdf[]
+** Video: http://free-electrons.com/pub/video/2010/fosdem/fosdem2010-workshop-cross-build-systems.ogv[]
+
+* Buildroot Developer Day
+  co-located with ELC-E 2009 (October 17, 2009 - Grenoble, France)
++
+The first _Buildroot Developer Day_ took place on Saturday, October
+17th in Grenoble, France, just the day after Embedded Linux Conference
+Europe.
++
+This _Developer Day_ aims at allowing Buildroot developers to meet and
+exchange ideas on the project and its future.
++
+This _Developer Day_ took place thanks to the sponsoring of
+http://www.calao-systems.com[Calao Systems] and
+http://www.free-electrons.com[Free Electrons].
+
+[[material]]
+Buildroot material
+------------------
+
+Some regular contributors give talks about their experience with
+Buildroot.
+
+Hereafter is a list of videos or slides or orther material used during
+these presentations.
 
-* Announcement & agenda thread: http://lists.busybox.net/pipermail/buildroot/2012-January/049340.html[]
-* Report: http://lists.busybox.net/pipermail/buildroot/2012-February/050371.html[]
+[WARNING]
+Keep in mind that the information given in these documents may be
+outdated, refer to this manual for the latest and up-to-date
+information.
 
-Buildroot Developer Days aside ELC-E 2012 (November 3-4, 2012 - Barcelona)
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+* ELC 2013: Technical Showcase
+** http://free-electrons.com/~thomas/pub/buildroot-poster.png[Poster]
+** http://free-electrons.com/~thomas/pub/buildroot-slides.pdf[Slides]
 
-* Event page: http://elinux.org/Buildroot:DeveloperDaysELCE2012[]
+* ELC 2012: Buildroot: A nice, simple and efficient embedded Linux
+  build system
+** http://elinux.org/images/9/9e/Buildroot2.pdf[Slides]
+** http://video.linux.com/videos/buildroot-a-nice-simple-and-efficient-embedded-linux-build-system[Video]
 
-Buildroot presentation at LSM 2012 (July 12-14, 2012 - Geneva)
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+* ELC-E 2011: Using Buildroot in real projects
+** http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf[Slides]
+** Videos:
+http://free-electrons.com/pub/video/2011/elce/elce-2011-petazzoni-buildroot-for-real-project.webm[full HD],
+ http://free-electrons.com/pub/video/2011/elce/elce-2011-petazzoni-buildroot-for-real-project-450p.webm[450x800]
 
-* Announcement: http://lists.busybox.net/pipermail/buildroot/2012-May/053845.html[]
+* FOSDEM 2010: Build Systems: Present & Future
+** http://send-patches.org/news/20100211-1-FOSDEM-Crossdev-Workshop.pdf[Slides]
+** http://free-electrons.com/pub/video/2010/fosdem/fosdem2010-workshop-cross-build-systems.ogv[Video]
 
 
-- 
1.8.4.1
