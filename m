From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 22:48:30 +0200
Subject: [Buildroot] [PATCHv2 1/1] board/wandboard: fix perl related
	linux compilation error
In-Reply-To: <87r3lb22jp.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 03 Oct 2015 21:08:10 +0200")
References: <1442889921-6713-1-git-send-email-imrehg@gmail.com>
 <20150922154716.0c3fec44@free-electrons.com>
 <87r3lb22jp.fsf@dell.be.48ers.dk>
Message-ID: <87fv1r1xwh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> If the problem is serious, I don't really see another option than
 >> having some logic in linux.mk to detect if the kernel is affected by
 >> the problem, and replacing the perl script by a bc script.

 > Step 1 must be to understand what the issue is exactly and what version
 > of perl/make triggers it.

 > Imreh, can you clarify?

Could it be that your system perl enables strict mode by default? What
distribution and perl version are you using?

I just built wandboard_defconfig without any problems here (perl 5.20.2
/ Debian).

-- 
Bye, Peter Korsgaard
