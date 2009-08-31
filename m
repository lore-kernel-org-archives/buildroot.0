From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Mon, 31 Aug 2009 11:24:24 +0200
Subject: [Buildroot] Recursive variable `UTIL-LINUX_DEPENDENCIES' references
	itself (eventually).
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6712C8E5@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

Release 2009.08 build stops (current GIT also).


Target : ARM (make at91sam9g20dfc_defconfig)


package/util-linux/util-linux.mk:75: *** Recursive variable
`UTIL-LINUX_DEPENDENCIES' references itself (eventually).  Stop.

Regards
Noel


Note : 
A) 2009.08rc3 does not have this problem
B) Git tree from yesterday  morning was also working fine for me.
