From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Mar 2012 16:40:04 +0100
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes
Message-ID: <cover.1332171599.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit e687bb71a028303f326aeebfaf94a3ac1c43b4e4:

  gcc: bump 4.4.x version (2012-03-13 16:27:25 +0100)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git misc-fixes

Thomas Petazzoni (3):
      transmission: add missing host-intltool dependency
      at: uses fork(), so requires MMU
      glib-networking: add missing host-intltool dependency

 package/at/Config.in                       |    1 +
 package/glib-networking/glib-networking.mk |    6 +++++-
 package/transmission/transmission.mk       |    1 +
 3 files changed, 7 insertions(+), 1 deletions(-)

Thanks,
-- 
Thomas Petazzoni
