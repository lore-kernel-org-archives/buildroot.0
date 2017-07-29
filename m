From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:41:09 +0200
Subject: [Buildroot] [git commit] utils/readme.txt: add documentation of
	genrandconfig
Message-ID: <20170729133709.B1B5B7FA00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a074e634499a319061f691a4ab6208ae73714b99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/readme.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/readme.txt b/utils/readme.txt
index fd20e8e..3064ece 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -15,6 +15,11 @@ check-package
     a script that checks the coding style of a package's Config.in and
     .mk files, and also tests them for various types of typoes.
 
+genrandconfig
+    a script that generates a random configuration, used by the autobuilders
+    (http://autobuild.buildroot.org). It selects a random toolchain from
+    support/config-fragments/autobuild and randomly selects packages to build.
+
 get-developpers
     a script to return the list of people interested in a specific part
     of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
