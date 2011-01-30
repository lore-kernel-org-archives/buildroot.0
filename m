From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jan 2011 15:37:49 +0100
Subject: [Buildroot] [PATCH 5/6] Do not mention
	toolchain/uClibc/uClibc.config-locale
In-Reply-To: <cover.1296398261.git.thomas.petazzoni@free-electrons.com>
References: <cover.1296398261.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e24f48609cc9c204ff7df26fe82f7fa1eb1322c0.1296398261.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uClibc configuration file toolchain/uClibc/uClibc.config-locale
does not exist anymore.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index e815ee9..04cbe67 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -409,9 +409,8 @@
       your configuration changes as appropriate.</li>
 
       <li>Copy the <code>.config</code> file to
-      <code>toolchain/uClibc/uClibc.config</code> or
-      <code>toolchain/uClibc/uClibc.config-locale</code>. The former
-      is used if you haven't selected locale support in Buildroot
+      <code>toolchain/uClibc/uClibc.config</code>. The former is used
+      if you haven't selected locale support in Buildroot
       configuration, and the latter is used if you have selected
       locale support.</li>
 
@@ -419,9 +418,8 @@
     </ol>
 
     <p>Otherwise, you can simply change
-    <code>toolchain/uClibc/uClibc.config</code> or
-    <code>toolchain/uClibc/uClibc.config-locale</code>, without running
-    the configuration assistant.</p>
+    <code>toolchain/uClibc/uClibc.config</code>, without running the
+    configuration assistant.</p>
 
     <p>If you want to use an existing config file for uclibc, then see
     section <a href="#environment_variables">environment variables</a>.</p>
-- 
1.7.0.4
