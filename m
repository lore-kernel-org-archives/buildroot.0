From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Jan 2014 22:46:05 +0100
Subject: [Buildroot] [PATCH 0 of 5 v2] Deprecation: clarify manual,
	remove ttcp and lzma
Message-ID: <patchbomb.1390254365@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---

 Config.in                                             |   8 ----
 Config.in.legacy                                      |  29 ++++++++++----
 docs/manual/appendix.txt                              |   8 +++-
 package/Config.in                                     |   2 -
 package/flex/Config.in                                |   2 +-
 package/lzma/Config.in                                |  13 ------
 package/lzma/lzma.mk                                  |   2 -
 package/ttcp/Config.in                                |   7 ---
 package/ttcp/ttcp-0001-replace-deprecated-bcopy.patch |  15 -------
 package/ttcp/ttcp.mk                                  |  25 ------------
 10 files changed, 29 insertions(+), 82 deletions(-)
