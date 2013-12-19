From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Dec 2013 21:13:00 +0100
Subject: [Buildroot] [PATCH 0 of 2] Unify comments on udev /dev management
	dependency
Message-ID: <patchbomb.1387483980@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

--
 docs/manual/adding-packages-directory.txt |  17 +++++++++++++++++
 package/libmbim/Config.in                 |   2 +-
 package/modem-manager/Config.in           |   2 +-
 package/network-manager/Config.in         |   5 +++--
 package/systemd/Config.in                 |   2 +-
 package/udev/Config.in                    |   9 +++------
 6 files changed, 26 insertions(+), 11 deletions(-)
