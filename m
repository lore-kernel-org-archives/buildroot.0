From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Nov 2013 09:47:55 +0100
Subject: [Buildroot] [PATCH 0 of 6 v3] legal info: split host and package
	output
Message-ID: <patchbomb.1384246075@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Makefile                     |  25 +++++++++++++++----------
 docs/manual/legal-notice.txt |  21 ++++++++++++---------
 package/pkg-generic.mk       |  27 ++++++++++++++++++---------
 package/pkg-utils.mk         |  39 ++++++++++++++++++++++++++-------------
 4 files changed, 71 insertions(+), 41 deletions(-)
