From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Sep 2010 22:09:30 +0200
Subject: [Buildroot] [ Patch 0/4] Fix for POSIX compliance
In-Reply-To: <1285017969-32280-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Mon, 20 Sep 2010 23:26:05 +0200")
References: <1285017969-32280-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87fwwrxabp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Hello All!
 Yann> This series adds fixes for POSIX 1003.1-2008 compliance in some shell
 Yann> scripts, with respect to string comparison. POSIX says that string
 Yann> comparison in test(1) is done using a sing '='; using two is a bashism.
 Yann> See:
 Yann>   http://www.opengroup.org/onlinepubs/9699919799/utilities/test.html
 Yann>   man 1 test
 Yann>   man 1 bash

Committed all 4, thanks!

-- 
Bye, Peter Korsgaard
