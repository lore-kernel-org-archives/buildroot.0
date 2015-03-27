From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Mar 2015 18:47:38 +0100
Subject: [Buildroot] [git commit] package/dovecot: fix hash typo
Message-ID: <20150327174740.87961818C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c820091d1a1813e6de4016ea510a047847f9648
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dovecot/dovecot.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 7f2f9b1..bcfffbb 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256sum	56ce1287a17fa88a2083116db00200deff1a5390af5eac1c8ae3f59a2079cff0	dovecot-2.2.16.tar.gz
+sha256	56ce1287a17fa88a2083116db00200deff1a5390af5eac1c8ae3f59a2079cff0	dovecot-2.2.16.tar.gz
