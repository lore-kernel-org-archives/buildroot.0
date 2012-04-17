From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:25 +0200
Subject: [Buildroot] [PATCH 13/22] Remove unused GNU_TARGET_SUFFIX
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <60a226b4a2b427209157f962136e1f9cfe09ed93.1334673910.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4f29cba..a48fb87 100644
--- a/Makefile
+++ b/Makefile
@@ -235,8 +235,6 @@ BZCAT:=$(call qstrip,$(BR2_BZCAT))
 XZCAT:=$(call qstrip,$(BR2_XZCAT))
 TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
-GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
-
 # packages compiled for the host go here
 HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 
-- 
1.7.4.1
