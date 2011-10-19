From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 19 Oct 2011 09:25:23 +0200
Subject: [Buildroot] [PATCH 0 of 2 v2] gentargets: add scp and Mercurial
	download helpers
Message-ID: <patchbomb.1318602760@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds download methods for scp and Mercurial.

Documentation was updated in the first version of this series, but this update
was left out in this series because of the move to asciidoc that is not yet
complete. Once the new documentation format is in master, it needs to be
updated with these new features.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: update scp patch based on comments.

 Config.in                   |  17 ++++++++++++++++-
 package/Makefile.package.in |  82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 91 insertions(+), 8 deletions(-)
