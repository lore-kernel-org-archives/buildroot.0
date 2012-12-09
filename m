From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Dec 2012 21:56:47 +0100
Subject: [Buildroot] [PATCH 4/8] rt-tests: not available on avr32,
	too old uClibc
In-Reply-To: <888c187be8b5ed6f62a1a7b8c825a980009fb365.1355076808.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Dec 2012 19:13:59 +0100")
References: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
 <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
 <888c187be8b5ed6f62a1a7b8c825a980009fb365.1355076808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87y5h7uepc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The old uClibc used for the AVR32 architecture does not implement
 Thomas> priority inheritance, therefore rt-tests cannot build.

Committed, thanks.

-- 
Bye, Peter Korsgaard
