From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Dec 2017 00:39:04 +0100
Subject: [Buildroot] [PATCH 4/4] legacy: update comment that old entries
 have been removed
In-Reply-To: <cover.1514331522.git.yann.morin.1998@free.fr>
References: <cover.1514331522.git.yann.morin.1998@free.fr>
Message-ID: <c5906a1a469751cf2fada33321dfe6ea206ab0b9.1514331522.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Config.in.legacy | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bff85637c9..907a51ec7c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -135,10 +135,10 @@ comment "legacy options in the menu below. Once you have     "
 comment "disabled all legacy options, this text will         "
 comment "disappear and you will be able to start the build.  "
 comment "*                                                   "
-comment "Note: at some point in the future, the oldest legacy"
-comment "options will be removed, and configuration files    "
-comment "that still have those options set, will fail to     "
-comment "build, or run, in unpredictable ways.               "
+comment "Note: legacy options older than 5 years have been   "
+comment "removed, and configuration files that still have    "
+comment "those options set, will fail to build, or run, in   "
+comment "unpredictable ways.                                 "
 comment "----------------------------------------------------"
 endif
 
-- 
2.11.0
