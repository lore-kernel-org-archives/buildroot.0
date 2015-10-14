From: Alan Ott <alan@softiron.co.uk>
Date: Wed, 14 Oct 2015 17:51:18 -0400
Subject: [Buildroot] [PATCH 0/5] Move download links away from Google Code
Message-ID: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Google Code going away early next year. Remove download links from
Google Code and find the new official repos for those projects.

These patches came from Buildroot Dev Days in Dublin. There will be more
to come to clean up the other projects using Google Code.

Alan Ott (5):
  dsp-tools: Move download link away from Google Code
  gst-dsp: Move download link away from Google Code
  gst-omapfb: Move download link away from Google Code
  gtest: Upgrade to GitHub HEAD
  gmock: Upgrade to GitHub HEAD

 package/dsp-tools/dsp-tools.mk             |  4 ++--
 package/gmock/0001-force-use-python2.patch |  8 ++++----
 package/gmock/gmock.hash                   |  4 ++--
 package/gmock/gmock.mk                     | 31 ++++++++++--------------------
 package/gstreamer/gst-dsp/gst-dsp.mk       |  4 ++--
 package/gstreamer/gst-omapfb/gst-omapfb.mk |  4 ++--
 package/gtest/gtest.hash                   |  4 ++--
 package/gtest/gtest.mk                     | 19 ++++++++----------
 8 files changed, 32 insertions(+), 46 deletions(-)

-- 
2.1.4
