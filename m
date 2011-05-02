From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 May 2011 21:53:23 +0200
Subject: [Buildroot] [PATCHv2] toolchain/gcc: add openmp support option
In-Reply-To: <1304360201-16074-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Mon, 2 May 2011 15:16:41 -0300")
References: <1304360201-16074-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87iptsswuk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add OpenMP support in gcc as an option instead of dynamically
 Gustavo> enabling it when threads are present.  Also fix it up since we
 Gustavo> never installed libgomp to the target or staging thus it was
 Gustavo> never really functional.

Committed, thanks.

-- 
Bye, Peter Korsgaard
