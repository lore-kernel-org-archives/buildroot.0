From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Mar 2008 21:19:08 +0100
Subject: [Buildroot] $(ARCH) not set & mirrors
In-Reply-To: <1205178237.10692.178.camel@nigel-x60> (Nigel Kukard's message of
	"Mon\, 10 Mar 2008 19\:43\:57 +0000")
References: <1205178237.10692.178.camel@nigel-x60>
Message-ID: <878x0q2uyr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

 Nigel> Hi Guys, 1. As reported by another gentleman earlier this
 Nigel> month, I'm having the same issue with $(ARCH) not being set
 Nigel> for the default build options freshly checked out from
 Nigel> svn. Where can I look to debug this?

I have not seen this - Details please.

 Nigel> 2. I've found quite a number of make files which don't use the
 Nigel> mirror's defined in menu config to retrieve the sources
 Nigel> ... can I submit patches to fix this or is it intentional?

Sounds like a bug. Please submit.

-- 
Bye, Peter Korsgaard
