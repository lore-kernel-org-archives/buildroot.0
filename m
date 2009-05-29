From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 May 2009 19:57:59 +0200
Subject: [Buildroot] 202: Illegal number: gcc
In-Reply-To: <20090529171328.1842d7f4@surf> (Thomas Petazzoni's message of
	"Fri\, 29 May 2009 17\:13\:28 +0200")
References: <133898.99840.qm@web111905.mail.gq1.yahoo.com>
	<87bppc570t.fsf@macbook.be.48ers.dk> <20090529171328.1842d7f4@surf>
Message-ID: <873aan6bbs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Fri, 29 May 2009 16:16:18 +0200,
 Thomas> Peter Korsgaard <jacmet@uclibc.org> a ?crit :

 >> Do you have makeinfo installed (the texinfo package) and what is it's
 >> version? Any particular reason why you are building binutils 2.18 and
 >> not the standard 2.19.1?

 Thomas> IIRC, there used to be a bug in binutils check for makeinfo. If the
 Thomas> makeinfo version was too recent, then the regexp used in the binutils
 Thomas> check didn't find makeinfo as a valid version.

Yes, but that was afaik only in 2.17. (it checked for 4.?, so 4.1x failed).

-- 
Bye, Peter Korsgaard
