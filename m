From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 25 Jul 2017 23:36:13 +0200
Subject: [Buildroot] [PATCH 2/2] utils/readme.txt: add documentation of
	genrandconfig
In-Reply-To: <20170725213613.6714-1-arnout@mind.be>
References: <20170725213613.6714-1-arnout@mind.be>
Message-ID: <20170725213613.6714-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/readme.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/readme.txt b/utils/readme.txt
index fd20e8ee67..3064ecec32 100644
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
-- 
2.13.2
