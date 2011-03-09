From: Phil Edworthy <PHIL.EDWORTHY@renesas.com>
Date: Wed, 09 Mar 2011 11:40:04 +0000
Subject: [Buildroot] [PATCH] Add Renesas ttySC* devices
In-Reply-To: <1299670804-26606-1-git-send-email-phil.edworthy@renesas.com>
References: <1299670804-26606-1-git-send-email-phil.edworthy@renesas.com>
Message-ID: <1299670804-26606-2-git-send-email-phil.edworthy@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 target/generic/device_table.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index 15132f9..38fe1e8 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -76,6 +76,7 @@
 /dev/ttyCPM	c	666	0	0	204	46	0	1	4
 /dev/ttyAMA	c	666	0	0	204	64	0	1	4
 /dev/ttySAC	c	666	0	0	204	64	0	1	4
+/dev/ttySC	c	666	0	0	204	8	0	1	6
 /dev/ttyPSC	c	666	0	0	204	148	0	1	4
 /dev/ttyUL	c	666	0	0	204	187	0	1	4
 /dev/ttymxc	c	666	0	0	207	16	0	1	3
-- 
1.7.1
