From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 20:14:10 +0100
Subject: [Buildroot] [PATCH] toolchain/gcc: remove unused
	GCC_ENABLE_CLOCALE
In-Reply-To: <200901291949.12311.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Thu\, 29 Jan 2009 19\:49\:12 +0100")
References: <200901291949.12311.markus.heidelberg@web.de>
Message-ID: <877i4drkl9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> This variable was introduced in r17046 (add gfortran support,
 Markus> 2006-12-22) and wasn't used even there.

Thanks, committed as r25132.

-- 
Bye, Peter Korsgaard
