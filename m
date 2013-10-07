From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 07 Oct 2013 15:15:07 +0200
Subject: [Buildroot] [PATCH 0 of 6 v2] legal info: split host and package
	output
Message-ID: <patchbomb.1381151707@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Makefile                     |  25 +++++++++++++++----------
 docs/manual/legal-notice.txt |  21 ++++++++++++---------
 package/pkg-generic.mk       |  33 +++++++++++++++++++++++++--------
 package/pkg-utils.mk         |  39 ++++++++++++++++++++++++++-------------
 4 files changed, 78 insertions(+), 40 deletions(-)
