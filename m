From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Mar 2008 09:17:55 +0100
Subject: [Buildroot] $(ARCH) not set & mirrors
In-Reply-To: <1205216387.10692.185.camel@nigel-x60> (Nigel Kukard's message of
	"Tue\, 11 Mar 2008 06\:19\:47 +0000")
References: <1205178237.10692.178.camel@nigel-x60>
	<878x0q2uyr.fsf@macbook.be.48ers.dk>
	<1205216387.10692.185.camel@nigel-x60>
Message-ID: <871w6hznbg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

 Nigel> <snip>
 Nigel> 2. I've found quite a number of make files which don't use the
 Nigel> mirror's defined in menu config to retrieve the sources
 Nigel> ... can I submit patches to fix this or is it intentional?
 >> 
 >> Sounds like a bug. Please submit.

 Nigel> Please find attached.

Thanks. Committed except for the hunk changing the fakeroot
version. Please don't mix multiple changes in the same patch.

-- 
Bye, Peter Korsgaard
