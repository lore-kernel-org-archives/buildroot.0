From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 21 Jan 2014 08:54:08 +0100
Subject: [Buildroot] [PATCH 0 of 5 v3] Deprecation: clarify manual,
	remove ttcp and lzma
Message-ID: <patchbomb.1390290848@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


v3: Rebased

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in                                             |   8 ----
 Config.in.legacy                                      |  26 +++++++++++---
 docs/manual/appendix.txt                              |   8 ++++-
 package/Config.in                                     |   2 -
 package/flex/Config.in                                |   2 +-
 package/lzma/Config.in                                |  13 -------
 package/lzma/lzma.mk                                  |   2 -
 package/ttcp/Config.in                                |   7 ----
 package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch |  15 --------
 package/ttcp/ttcp.mk                                  |  25 --------------
 10 files changed, 28 insertions(+), 80 deletions(-)
