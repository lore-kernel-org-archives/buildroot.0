From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 28 Nov 2009 15:07:01 +0100
Subject: [Buildroot] Build jobbing
In-Reply-To: <200911271610.08010.minimod@morethan.org> (Michael S. Zick's
	message of "Fri\, 27 Nov 2009 16\:10\:05 -0600")
References: <200911271522.58858.minimod@morethan.org>
	<877htb638c.fsf@macbook.be.48ers.dk>
	<200911271610.08010.minimod@morethan.org>
Message-ID: <87tywe4ube.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

Hi,

 Michael> nand_{erase,lock,unlock) in BB-1.15.2 does not build.

I take it that you mean flash_eraseall / flash_unlock / flash_lock?

It works for me after 4e385ee7 - Could you update and try again?

-- 
Bye, Peter Korsgaard
