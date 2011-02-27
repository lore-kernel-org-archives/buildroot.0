From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 27 Feb 2011 15:37:22 +0100
Subject: [Buildroot] [PATCH 0 of 2] Facilitate saving of configuration files
 for board developers
Message-ID: <patchbomb.1298817442@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series intends to make the development life of board developers
working with buildroot easier, by providing two extra -update build targets
that copy over configuration files to their version-controlled counterparts.
The new targets, linux-update and config-update have the same behavior as
the already existing uclibc-update and busybox-update.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 linux/linux.mk |   7 +++++++
 Config.in      |  11 +++++++++++
 Makefile       |   9 +++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
