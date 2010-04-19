From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Apr 2010 22:53:50 +0200
Subject: [Buildroot] [PATCH 1/2] makedevs: move to package/
In-Reply-To: <cover.1271710428.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271710428.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5faae4869027d86cba895bf88b5b956c62310d30.1271710428.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since target/ doesn't contain any .mk file in subdirectories, also
remove the include in target/Makefile.in.
---
 {target => package}/makedevs/makedevs.c  |    0
 {target => package}/makedevs/makedevs.mk |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {target => package}/makedevs/makedevs.c (100%)
 rename {target => package}/makedevs/makedevs.mk (100%)

diff --git a/target/makedevs/makedevs.c b/package/makedevs/makedevs.c
similarity index 100%
rename from target/makedevs/makedevs.c
rename to package/makedevs/makedevs.c
diff --git a/target/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
similarity index 100%
rename from target/makedevs/makedevs.mk
rename to package/makedevs/makedevs.mk
-- 
1.6.3.3
