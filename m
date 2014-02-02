From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Feb 2014 13:11:15 +0100
Subject: [Buildroot] [PATCH 0 of 9] Python depends on/select cleanup
Message-ID: <patchbomb.1391343075@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patch series cleans up the packages depending on Python with the
strategy discussed earlier on the mailing list. The new strategy is
clarified in the manual.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-dependencies.txt |  281 +++++++++++++++++++++++
 docs/manual/adding-packages-directory.txt    |  236 +-------------------
 package/alsa-lib/Config.in                   |    9 -
 package/alsa-lib/alsa-lib.mk                 |    2 +-
 package/libdnet/Config.in                    |   13 -
 package/libdnet/libdnet.mk                   |    2 +-
 package/ola/Config.in                        |   15 +-
 package/ola/ola.mk                           |    2 +-
 package/python-posix-ipc/Config.in           |    1 +
 package/python-pyasn/Config.in               |    1 +
 package/python-pysnmp-apps/Config.in         |    1 +
 package/python-pysnmp-mibs/Config.in         |    1 +
 package/python-pysnmp/Config.in              |    1 +
 package/spice/Config.in                      |   11 +-
 package/supervisor/Config.in                 |    9 +-
 15 files changed, 307 insertions(+), 278 deletions(-)
