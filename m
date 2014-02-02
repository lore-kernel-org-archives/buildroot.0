From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Feb 2014 13:11:17 +0100
Subject: [Buildroot] [PATCH 2 of 9] manual: split information about
 Config.in dependencies to a separate section
In-Reply-To: <patchbomb.1391343075@argentina>
References: <patchbomb.1391343075@argentina>
Message-ID: <4d6698a4ee15f8eea597.1391343077@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the information about adding dependencies in Config.in files is
important and involves a number of rules, make sure it is mentioned in the
table of contents by creating a section for it.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-dependencies.txt |  3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-dependencies.txt b/docs/manual/adding-packages-dependencies.txt
--- a/docs/manual/adding-packages-dependencies.txt
+++ b/docs/manual/adding-packages-dependencies.txt
@@ -1,3 +1,6 @@
+Expressing dependencies in +Config.in+ files
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
 [[depends-on-vs-select]]
 Choosing +depends on+ or +select+
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
