From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Dec 2010 18:25:19 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.02/remove-config-scripts
Message-ID: <cover.1293038710.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 11ab05f53a16f635a27139b33170a9dadba9f3c5:
  Peter Korsgaard (1):
        qt: svg and multimedia modules depends on gui module as well

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.02/remove-config-scripts

Thomas Petazzoni (7):
      imagemagick: add patch to fix libxml2 issue and remove useless patch
      imagemagick: remove *-config scripts from TARGET_DIR
      neon: remove neon-config script from TARGET_DIR
      libdnet: remove dnet-config script from TARGET_DIR
      libpng: remove libpng*-config scripts from TARGET_DIR
      libxml2: remove xml2-config script from TARGET_DIR
      libxslt: remove xslt-config script from TARGET_DIR

 .../imagemagick-6.6.4-8-use-xml2-config.patch      |   31 ++++++++++++++++++++
 ....6.4-add-errno-h-if-argz-h-does-not-exist.patch |   11 -------
 package/imagemagick/imagemagick.mk                 |   10 ++++++
 package/libdnet/libdnet.mk                         |    6 ++++
 package/libpng/libpng.mk                           |    7 ++++
 package/libxml2/libxml2.mk                         |    6 ++++
 package/libxslt/libxslt.mk                         |    6 ++++
 package/neon/neon.mk                               |    6 ++++
 8 files changed, 72 insertions(+), 11 deletions(-)
 create mode 100644 package/imagemagick/imagemagick-6.6.4-8-use-xml2-config.patch
 delete mode 100644 package/imagemagick/imagemagick-6.6.4-add-errno-h-if-argz-h-does-not-exist.patch

Thanks,
-- 
Thomas Petazzoni
