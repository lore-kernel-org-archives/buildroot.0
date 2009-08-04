From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2009 16:15:38 +0200
Subject: [Buildroot] [PATCH 2/3] netsnmp: update TODO
In-Reply-To: <cover.1249395336.git.thomas.petazzoni@free-electrons.com>
References: <cover.1249395336.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d7890dd09302bc912cca13d65aa128eb826f9123.1249395336.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 TODO |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/TODO b/TODO
index bf98fea..8a73c7f 100644
--- a/TODO
+++ b/TODO
@@ -15,3 +15,13 @@ Buildroot2 TODOs
   present, and rerun the configuration... with the wrong environment
   variables (STRIP= is missing). An autoreconf on this package is
   probably necessary.
+
+- net-snmp:
+   - Figure out why the net-snmp build systems hardcodes rpath into
+     the libraries (and these rpath are completely wrong since they
+     are based on the host directory hierarchy)
+   - Figure out how to get the Perl support compiled
+   - Find someone more knowledgeable in net-snmp usage to tell how the
+     packaging could be improve (many files installed in /usr/share/,
+     many tools in /usr/bin, is this all necessary ? should it be
+     split in subpackages somehow ?)
-- 
1.6.0.4
