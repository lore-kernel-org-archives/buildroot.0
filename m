From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Apr 2020 16:23:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/stella: fix legal-info
Message-ID: <20200420142309.549296-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit a7210c24e343a13e58d1d45b7e0c4bdb51854857 forgot to update hash of
Copyright which has changed due to update in year:

https://github.com/stella-emu/stella/commit/275666b0af3e029b44be7e676526b8172da44736
https://github.com/stella-emu/stella/commit/9ad47ae5f3457693944a3754432ff1236c67203c

While at it, update indentation of hash file to two spaces

Fixes:
 - http://autobuild.buildroot.org/results/38fa47221f36f3db603ee54c86b9747b0c6ca5d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stella/stella.hash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index dcc56aadf6..fb7c598a2c 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 ddf53bb782c63c97c4e5d0fefa9eb256c62e0d5a328c78cc18f06eea45ba7369  stella-6.1.1-src.tar.xz
-sha256 062e708b8b88ea911b5c08000f1c4a5588235aa0c303bc893b5d92fb45cafd04  Copyright.txt
-sha256 58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
+sha256  ddf53bb782c63c97c4e5d0fefa9eb256c62e0d5a328c78cc18f06eea45ba7369  stella-6.1.1-src.tar.xz
+sha256  d207ee9e563fdd062582df8cbb6c8303b9879bd107692c0db2a32477e47dfa35  Copyright.txt
+sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
-- 
2.25.1
