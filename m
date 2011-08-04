From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Aug 2011 23:23:23 +0200
Subject: [Buildroot] [PATCH 5/5] manual: ignore generated files
In-Reply-To: <cover.1312492948.git.thomas.petazzoni@free-electrons.com>
References: <cover.1312492948.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f240cc545be3d098b4851a642b3d8447a46e15ea.1312492948.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/.gitignore |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 docs/manual/.gitignore

diff --git a/docs/manual/.gitignore b/docs/manual/.gitignore
new file mode 100644
index 0000000..cda42e4
--- /dev/null
+++ b/docs/manual/.gitignore
@@ -0,0 +1,4 @@
+manual.chunked/
+manual.html
+manual.pdf
+manual.text
-- 
1.7.4.1
