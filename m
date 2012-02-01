From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 01 Feb 2012 23:08:08 +0100
Subject: [Buildroot] [PATCH 4/4] Update the documentation to add these
	changes
In-Reply-To: <20120112093008.63cf020d@skate> (Thomas Petazzoni's message of
 "Thu, 12 Jan 2012 09:30:08 +0100")
References: <cover.1326304128.git.maxime.ripard@free-electrons.com>
 <ad9fb6b99c31f84658dcc8f15cbd5c2440ee0918.1326304128.git.maxime.ripard@free-electrons.com>
 <20120112093008.63cf020d@skate>
Message-ID: <87r4yecilz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> +* +LIBFOO_DEVICES+ lists the device files to be created by Buildroot
 >> +  when using the static device table. The syntax to use is the
 >> +  makedevs one.

 Thomas> Would be great to mention that <foo>_DEVICES and <foo>_PERMISSIONS are
 Thomas> optional, and where to find the makedevs syntax, or mention it directly
 Thomas> in the documentation (better).

Agreed. Care to write something up Thomas/Maxime?

-- 
Bye, Peter Korsgaard
