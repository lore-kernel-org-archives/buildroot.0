From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 05 Jun 2012 21:35:22 +0200
Subject: [Buildroot] [PATCH 0 of 2 v5-resend] Add find utility functions /
 exclude files from strip
Message-ID: <patchbomb.1338924922@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds a few utility functions to pkg-utils.mk that
help in composing find commands, and uses these functions to exclude
user-configured files and directories from being stripped in target-finalize.

Thanks to input from Arnout, the find functions are now much simpler and
should be clearly understandable by everyone.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v5: line up with latest git
v4: simplify find functions even further; whitespace changes
v3: update based on review comments, remove Python changes for now
v2: simplify find functions

 Config.in            |  19 +++++++++++++++++++
 Makefile             |  10 ++++++++--
 package/pkg-utils.mk |   9 +++++++++
 3 files changed, 36 insertions(+), 2 deletions(-)
