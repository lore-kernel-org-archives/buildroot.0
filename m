From: Willy Lambert <lambert.willy@gmail.com>
Date: Tue,  5 Feb 2013 21:51:31 +0100
Subject: [Buildroot] [PATCH 3/3] Integrating review modifications
In-Reply-To: <1360097491-20121-1-git-send-email-contact@team-ard.com>
References: <1360097491-20121-1-git-send-email-contact@team-ard.com>
Message-ID: <1360097491-20121-3-git-send-email-contact@team-ard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "A.R.D" <contact@team-ard.com>


Signed-off-by: A.R.D <contact@team-ard.com>
---
 docs/manual/what-is-next.txt |    6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 docs/manual/what-is-next.txt

diff --git a/docs/manual/what-is-next.txt b/docs/manual/what-is-next.txt
new file mode 100644
index 0000000..99a362b
--- /dev/null
+++ b/docs/manual/what-is-next.txt
@@ -0,0 +1,6 @@
+// -*- mode:doc; -*-
+
+What's next ?
+------------------------
+
+After having done your work with Buildroot, you will certainly want to use what you produced. The generated images has to be fitted on your board. This is a plain activity, higly depending on your hardware and is beyond the scope of Buildroot. Nevertheless, you can have a look at hints from xref:beyond-buildroot[]
-- 
1.7.9.5
