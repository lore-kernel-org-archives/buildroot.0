From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 18 Oct 2013 22:31:36 +0200
Subject: [Buildroot] [PATCH 12/12] board: add warning to readme files
	explaining how to flash the target
In-Reply-To: <cover.1382127504.git.s.martin49@gmail.com>
References: <cover.1382127504.git.s.martin49@gmail.com>
Message-ID: <b67f14903e6e33f2790ff7ee8c82c658f8c12b01.1382127504.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only add a warning message in readme.txt files giving intructions to
flash the target memory device.

All others boards coming with a readme.txt files explain how to
prepare a removable media or how to use the emulator.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 board/avnet/s6lx9_microboard/readme.txt | 10 ++++++++++
 board/freescale/mpc8315erdb/readme.txt  |  8 ++++++++
 board/freescale/p1010rdb/readme.txt     |  8 ++++++++
 board/telit/evk-pro3/readme.txt         |  9 +++++++++
 4 files changed, 35 insertions(+)

diff --git a/board/avnet/s6lx9_microboard/readme.txt b/board/avnet/s6lx9_microboard/readme.txt
index 3cb2ce9..2195d72 100644
--- a/board/avnet/s6lx9_microboard/readme.txt
+++ b/board/avnet/s6lx9_microboard/readme.txt
@@ -1,3 +1,13 @@
+*************************  /!\ WARNING /!\  *************************
+The following information are given without warranty of any kind.
+
+Please refer to the the instructions provided by the target vendor.
+
+They are contributions from Buildroot users, but Buildroot developers
+do not ensure their correctness, nor maintain them.
+*************************  /!\ WARNING /!\  *************************
+
+
 This is the buildroot board support for the Avnet Spartan6 LX9 MicroBoard.
 
 The Avnet S6LX9 Microboard is a small USB-Stick sized module containing
diff --git a/board/freescale/mpc8315erdb/readme.txt b/board/freescale/mpc8315erdb/readme.txt
index f7f9c94..bb8d255 100644
--- a/board/freescale/mpc8315erdb/readme.txt
+++ b/board/freescale/mpc8315erdb/readme.txt
@@ -1,3 +1,11 @@
+*************************  /!\ WARNING /!\  *************************
+The following information are given without warranty of any kind.
+
+Please refer to the the instructions provided by the target vendor.
+
+They are contributions from Buildroot users, but Buildroot developers
+do not ensure their correctness, nor maintain them.
+*************************  /!\ WARNING /!\  *************************
 
 ******************** WARNING ********************
 The compiled U-Boot binary is intended for NAND flash only!
diff --git a/board/freescale/p1010rdb/readme.txt b/board/freescale/p1010rdb/readme.txt
index 5b56873..2af088f 100644
--- a/board/freescale/p1010rdb/readme.txt
+++ b/board/freescale/p1010rdb/readme.txt
@@ -1,3 +1,11 @@
+*************************  /!\ WARNING /!\  *************************
+The following information are given without warranty of any kind.
+
+Please refer to the the instructions provided by the target vendor.
+
+They are contributions from Buildroot users, but Buildroot developers
+do not ensure their correctness, nor maintain them.
+*************************  /!\ WARNING /!\  *************************
 
 ******************** WARNING ********************
 The compiled U-Boot binary is intended for NOR flash only!
diff --git a/board/telit/evk-pro3/readme.txt b/board/telit/evk-pro3/readme.txt
index ace9dd4..c5b0cf3 100644
--- a/board/telit/evk-pro3/readme.txt
+++ b/board/telit/evk-pro3/readme.txt
@@ -1,3 +1,12 @@
+*************************  /!\ WARNING /!\  *************************
+The following information are given without warranty of any kind.
+
+Please refer to the the instructions provided by the target vendor.
+
+They are contributions from Buildroot users, but Buildroot developers
+do not ensure their correctness, nor maintain them.
+*************************  /!\ WARNING /!\  *************************
+
 Buildroot board support for Telit EVK-PRO3 with Telit GE863-PRO3
 
 Official site:
-- 
1.8.4.1
