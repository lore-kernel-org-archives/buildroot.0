From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Wed,  5 Apr 2017 15:28:50 +0200
Subject: [Buildroot] [PATCH v2 2/2] Take ownership of the (orphaned)
	syslinux package.
In-Reply-To: <1491398930-6130-1-git-send-email-benoit.allard@greenbone.net>
References: <1491386987-6695-1-git-send-email-benoit.allard@greenbone.net>
 <1491398930-6130-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <1491398930-6130-2-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As it turns out, I am the only one who touched it in the last year.

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 37c610e..fbc70e5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -150,6 +150,7 @@ N:	Benjamin Kamath <kamath.ben@gmail.com>
 F:	package/lapack/
 
 N:	Beno?t Allard <benoit.allard@greenbone.net>
+F:	boot/syslinux/
 F:	package/dc3dd/
 
 N:	Bernd Kuhls <bernd.kuhls@t-online.de>
-- 
2.1.4
