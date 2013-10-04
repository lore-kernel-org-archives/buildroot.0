From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 04 Oct 2013 15:12:29 +0200
Subject: [Buildroot] [PATCH 0 of 5] legal info: split host and package output
Message-ID: <patchbomb.1380892349@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Makefile                     |  25 +++++++++++++++----------
 docs/manual/legal-notice.txt |   6 +++---
 package/pkg-generic.mk       |  12 ++++++------
 package/pkg-utils.mk         |  32 +++++++++++++++++++-------------
 4 files changed, 43 insertions(+), 32 deletions(-)
