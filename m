From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Feb 2014 17:55:40 +0100
Subject: [Buildroot] [PATCH 0 of 4] alsa-lib/alsa-utils autobuild fixes
Message-ID: <patchbomb.1392224140@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

This series fixes the alsa-lib / alsa-utils autobuild failures, most notably
seen on Blackfin FLAT, but the alsa-utils problem was also seen on ARM.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/alsa-lib/alsa-lib-avr32-bad-inline.patch                         |   0 
 package/alsa-lib/alsa-lib-no-mmu.patch                                   |   0 
 package/alsa-lib/alsa-lib-0003-dlmisc.patch                              |  59 +++++++++
 package/alsa-lib/alsa-lib-0004-conditional-enabling-of-libdl-in-m4.patch |  35 +++++
 package/alsa-utils/alsa-utils-0001-no-mmu.patch                          |  61 ++++++++++
 package/alsa-utils/alsa-utils.mk                                         |   1 +
 6 files changed, 156 insertions(+), 0 deletions(-)
