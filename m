From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:12:32 +0100
Subject: [Buildroot] [git commit] Config.in: Add BR2_DEPRECATED_SINCE_2015_05
Message-ID: <20150304211938.91C7980E2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f1556e1c8fb5a0e4069b1bd692ea90e37df4c7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the deprecation of certain features in 2015.05, add
the BR2_DEPRECATED_SINCE_2015_05 symbol.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index ce239d6..0598042 100644
--- a/Config.in
+++ b/Config.in
@@ -312,6 +312,10 @@ config BR2_DEPRECATED_SINCE_2015_02
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2015_05
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
