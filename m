From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Nov 2012 22:56:16 +0100
Subject: [Buildroot] [PATCH 02/23] manual: make clean target consistent
	with others in buildroot
In-Reply-To: <CAHXCMMJC5CA4jtpX9HscYhpq-E5jntjkrWYej6CZi=SBwy7dSA@mail.gmail.com>
 (Samuel Martin's message of "Mon, 12 Nov 2012 00:34:13 +0100")
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
 <1352639701-27829-3-git-send-email-s.martin49@gmail.com>
 <50A02D3E.8060701@mind.be>
 <CAHXCMMJC5CA4jtpX9HscYhpq-E5jntjkrWYej6CZi=SBwy7dSA@mail.gmail.com>
Message-ID: <87zk2i1qf3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 >> I think you can safely remove clean-$(1) - or should we consider this API?

 Samuel> Actually, I kept it to, at least, not break the release.  IIRC,
 Samuel> Peter generates the manual and includes it in the release
 Samuel> tarball.  That's why I choose the safe path ;-) but I can
 Samuel> remove it as soon as Peter has confirmed it does not break
 Samuel> anything.

I just use 'make release' which doesn't use the clean target, so it can
get removed.

-- 
Bye, Peter Korsgaard
