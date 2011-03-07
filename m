From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 22:22:44 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/remove-config-scripts
Message-ID: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 0a064b48c9d1044b05aee65272f5af7f28879473:
  Gustavo Zacarias (1):
        gst-ffmpeg: bump to version 0.10.11

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.05/remove-config-scripts

Thomas Petazzoni (6):
      imagemagick: remove *-config scripts from TARGET_DIR
      neon: remove neon-config script from TARGET_DIR
      libdnet: remove dnet-config script from TARGET_DIR
      libpng: remove libpng*-config scripts from TARGET_DIR
      libxml2: remove xml2-config script from TARGET_DIR
      libxslt: remove xslt-config script from TARGET_DIR

 package/imagemagick/imagemagick.mk |   10 ++++++++++
 package/libdnet/libdnet.mk         |    8 ++++++++
 package/libpng/libpng.mk           |    9 +++++++++
 package/libxml2/libxml2.mk         |    8 ++++++++
 package/libxslt/libxslt.mk         |    8 ++++++++
 package/neon/neon.mk               |    8 ++++++++
 6 files changed, 51 insertions(+), 0 deletions(-)

Thanks,
-- 
Thomas Petazzoni
