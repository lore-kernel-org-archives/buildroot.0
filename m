From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:33 +0100
Subject: [Buildroot] [PATCH 02/39] Define TARGET_MAKE_ENV similarly to
	HOST_MAKE_ENV
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <497abb8211944fb5c9c012a52e9a630f220510a9.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 8edd193..5b6161b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -236,6 +236,8 @@ TARGET_CONFIGURE_ENV=\
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	FCFLAGS="$(TARGET_FCFLAGS)" \
 
+TARGET_MAKE_ENV=PATH=$(TARGET_PATH)
+
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AR="$(HOSTAR)" \
 		AS="$(HOSTAS)" \
-- 
1.6.3.3
