From: Will Newton <will.newton@gmail.com>
Date: Tue, 16 Jun 2009 22:03:55 +0100
Subject: [Buildroot] [pull request] gstreamer fixes
Message-ID: <87a5b0800906161403y71033af6ue68d3bc8bd851bc8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 220dca451ef4b2f680ca35caacb29f6a6138068a:
  Nigel Kukard (1):
        dmraid linking against host system fix

are available in the git repository at:

  git://github.com/willnewton/buildroot.git master

Will Newton (5):
      gstreamer: Allow libxml2 dependency to be configured.
      gst-plugins-good: Allow souphttpsrc plugin to be configured.
      gstreamer: Bump version to 0.10.23.
      gst-plugins-base: Bump version to 0.10.23.
      gst-plugins-bad: New package.

 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst-plugins-bad/Config.in       |  171 +++++++++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |  321 ++++++++++++++++++++
 package/multimedia/gst-plugins-base/Config.in      |    3 +
 .../gst-plugins-base/gst-plugins-base.mk           |    8 +-
 package/multimedia/gst-plugins-good/Config.in      |    4 +
 .../gst-plugins-good/gst-plugins-good.mk           |    7 +
 package/multimedia/gstreamer/Config.in             |    7 +-
 package/multimedia/gstreamer/gstreamer.mk          |   12 +-
 9 files changed, 530 insertions(+), 4 deletions(-)
 create mode 100644 package/multimedia/gst-plugins-bad/Config.in
 create mode 100644 package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
