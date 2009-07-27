From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 11:08:17 +0200
Subject: [Buildroot] [PATCH 1/1] Update CHANGES with recent improvements
In-Reply-To: <cover.1248685694.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248685694.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5139e9e41281e04d7644bec98305654baa9749d9.1248685694.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mention X.org and external toolchain improvements in the CHANGES file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3b97df9..aa66ca8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,13 @@
 2009.08, Not yet released:
 
+	Improvement of external toolchain support: the configuration
+	given to Buildroot is not verified against the real toolchain
+	configuration.
+
+	Cleanup X.org support: clarified configuration options, and
+	removed mandatory dependency on useless libraries such as
+	libXt or libXaw.
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#83: liblockfile fails to compile due to eaccess redefinition
-- 
1.6.0.4
