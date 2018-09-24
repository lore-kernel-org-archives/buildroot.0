From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 24 Sep 2018 02:14:46 +0200
Subject: [Buildroot] [PATCH 2/2] iputils: Add hash for ninfod/COPYING
 license file
In-Reply-To: <20180924001446.24617-1-petr.vorel@gmail.com>
References: <20180924001446.24617-1-petr.vorel@gmail.com>
Message-ID: <20180924001446.24617-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/iputils/iputils.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 89c3ab6013..14e2c67134 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 da14105291dd491f28ea91ade854ed10aee8ba019641c80eed233de3908be7c5  iputils-s20180629.tar.gz
+sha256 966075293e45785230c19415bcda15bd07c75bead4fe73332d1a4b9c45bb321f  ninfod/COPYING
-- 
2.19.0.rc2
