From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Mon,  5 Mar 2018 12:15:05 -0500
Subject: [Buildroot] [PATCH 3/3] DEVELOPERS: add myself as the ts5500
 maintainer
In-Reply-To: <20180305171505.4003-1-vivien.didelot@savoirfairelinux.com>
References: <20180305171505.4003-1-vivien.didelot@savoirfairelinux.com>
Message-ID: <20180305171505.4003-4-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new entry for myself listing the TS-5500 board directory and
defconfig file.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 41e1b54d99..3feb6c88e7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1821,6 +1821,10 @@ F:	package/pixz/
 N:	Vinicius Tinti <viniciustinti@gmail.com>
 F:	package/python-thrift/
 
+N:	Vivien Didelot <vivien.didelot@savoirfairelinux.com>
+F:	board/technologic/ts5500/
+F:	configs/ts5500_defconfig
+
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
 F:	package/zbar/
-- 
2.16.2
