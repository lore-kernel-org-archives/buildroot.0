From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 01 Jul 2017 10:14:18 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_9991=5D_SGX_Error_implicit_declarati?=
 =?utf-8?b?b24gb2YgZnVuY3Rpb24g4oCYZG1hY19tYXBfYXJlYeKAmQ==?=
In-Reply-To: <bug-9991-163@https.bugs.busybox.net/>
References: <bug-9991-163@https.bugs.busybox.net/>
Message-ID: <bug-9991-163-BGFrxTeuhX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9991

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
As far as I know, ti-gfx is no longer supported and for recent SoCs with recent
kernels you should use ti-gfx-km (and -um). That's why beaglebone_qt5_defconfig
selects it. Is there any reason why you don't use that defconfig?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
