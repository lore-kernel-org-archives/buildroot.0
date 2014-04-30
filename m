From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Apr 2014 20:18:22 +0200
Subject: [Buildroot] [PATCH 0 of 2] Remove deprecated features (2014.05
	cycle)
Message-ID: <patchbomb.1398881902@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

This small patch series removes those deprecated features that can be
removed in 2014.05, being those that are deprecated since 2013.05.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in                            |   4 ----
 Config.in.legacy                     |  32 ++++++++++++++++++++++++++++++--
 package/Config.in                    |   1 -
 package/linux-headers/Config.in.host |  12 ------------
 package/pulseaudio/pulseaudio.mk     |   2 --
 package/vala/Config.in               |  19 -------------------
 package/vala/vala.mk                 |   8 --------
 7 files changed, 30 insertions(+), 48 deletions(-)
