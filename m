From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 22 Feb 2016 09:23:23 -0300
Subject: [Buildroot] [PATCH v2 0/4] Move download links away from Google Code
In-Reply-To: <444859483-2268-1-git-send-email-alan@softiron.co.uk>
References: <444859483-2268-1-git-send-email-alan@softiron.co.uk>
Message-ID: <1456143807-3350-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Google Code going away early next year. Remove download links from
Google Code and find the new official repos for those projects.

These patches came from Buildroot Dev Days in Dublin. There will be more
to come to clean up the other projects using Google Code.

Alan Ott (3):
  dsp-tools: Move download link away from Google Code
  gst-dsp: Move download link away from Google Code
  gst-omapfb: Move download link away from Google Code

Carlos Santos (1):
  gtest,gmock: Move download link away from Google Code

 package/dsp-tools/dsp-tools.mk                     |   4 +-
 package/gmock/0001-force-use-python2.patch         |   8 -
 ...0002-Copy-acx_pthread.m4-from-GTest-1.7.0.patch | 394 +++++++++++++++++++++
 package/gmock/Config.in                            |   2 +-
 package/gmock/gmock.hash                           |   4 +-
 package/gmock/gmock.mk                             |  23 +-
 package/gstreamer/gst-dsp/gst-dsp.mk               |   4 +-
 package/gstreamer/gst-omapfb/gst-omapfb.mk         |   4 +-
 package/gtest/0001-force-use-python2.patch         |  12 +
 package/gtest/Config.in                            |   2 +-
 package/gtest/gtest.hash                           |   4 +-
 package/gtest/gtest.mk                             |  11 +-
 12 files changed, 430 insertions(+), 42 deletions(-)
 create mode 100644 package/gmock/0002-Copy-acx_pthread.m4-from-GTest-1.7.0.patch
 create mode 100644 package/gtest/0001-force-use-python2.patch

-- 
2.5.0
