From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Wed,  2 Dec 2009 10:48:47 -0500
Subject: [Buildroot] [PATCH] This patch is only a small modification to the
	buildroot.html
Message-ID: <1259768927-21517-1-git-send-email-jdumaresq@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I added a small information about the sysroot option.

Signed-off-by: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
---
 docs/buildroot.html |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index c4f191a..7d78182 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -775,7 +775,9 @@ according to your cross-compiling toolchain.</p>
 href="http://ymorin.is-a-geek.org/dokuwiki/projects/crosstool">Crosstool-NG</a>.
 It allows to generate toolchains based on <i>uClibc</i>, <i>glibc</i>
 and <i>eglibc</i> for a wide range of architectures, and has good
-community support.</p>
+community support.
+If you build your external toolchain with buildroot, you must 
+enable BR2_TOOLCHAIN_SYSROOT in your .config file</p>
 
     <h2><a name="add_software" id="add_software"></a>Extending Buildroot with
     more software</h2>
-- 
1.6.3.3
