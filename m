From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 May 2010 23:08:54 +0200
Subject: [Buildroot] [PATCH 1/1] Fix the computation of
	REAL_GNU_TARGET_NAME
In-Reply-To: <c4c8601ed1df3f29c6ea87a8882340cb6486d7da.1273170989.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Thu, 6 May 2010 20:44:21 +0200")
References: <cover.1273170989.git.thomas.petazzoni@free-electrons.com>
	<cover.1273170989.git.thomas.petazzoni@free-electrons.com>
	<c4c8601ed1df3f29c6ea87a8882340cb6486d7da.1273170989.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pr1891qx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When the selected C library is glibc, the C library shouldn't be
 Thomas> mentionned in REAL_GNU_TARGET_NAME. In other words:

 Thomas>  arm-unknown-linux-uclibcgnueabi must be used for uClibc
 Thomas>  arm-unknown-linux-gnueabi must be used for glibc

 Thomas> This fixes the build of GDB on the target, as reported by Quotient
 Thomas> Remainder <quotientvremainder@gmail.com>.

Committed, thanks.

-- 
Bye, Peter Korsgaard
