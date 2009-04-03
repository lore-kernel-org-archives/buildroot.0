From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 03 Apr 2009 09:20:36 +0200
Subject: [Buildroot] [PATCH 2/5] mtd-utils: Added mtd-utils-1.2.0
In-Reply-To: <20090403012901.GA30190@cloud.net.au> (Hamish Moffatt's message
	of "Fri\, 3 Apr 2009 12\:29\:01 +1100")
References: <1238103279-8040-1-git-send-email-mroth@nessie.de>
	<1238103279-8040-3-git-send-email-mroth@nessie.de>
	<20090402004150.GD29488@cloud.net.au>
	<87hc175yvt.fsf@macbook.be.48ers.dk> <49D48376.2060708@nessie.de>
	<87d4bv5rw1.fsf@macbook.be.48ers.dk>
	<20090403012901.GA30190@cloud.net.au>
Message-ID: <878wmi5hkr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 Michael> This will clean up a lot of special handling of different mtd-utils.

 Hamish> Yes.. if there was an mtd-utils release that included mkfs.ubifs, we
 Hamish> could scrub the multiple versions completely..

Yes, including the git version. Supporting multiple versions of a
package (especially when the difference is so relatively large) is a
PITA from a maintainence / testing POV.

-- 
Bye, Peter Korsgaard
