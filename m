From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Jun 2009 11:42:22 +0200
Subject: [Buildroot] Can't debug threaded app on ARM920 (SIG32)
In-Reply-To: <20090623205834.67e9e8f5@surf> (Thomas Petazzoni's message of
	"Tue\, 23 Jun 2009 20\:58\:34 +0200")
References: <h1obk9$cnn$2@ger.gmane.org> <h1r6b2$kd5$2@ger.gmane.org>
	<20090623205834.67e9e8f5@surf>
Message-ID: <87ab3y3r41.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> I was also having an issue with gdb 6.8 on ARM targets, with an error
 Thomas> message saying ?register no longer active?. It is fixed by
 Thomas> http://cvs.fedoraproject.org/viewvc/devel/gdb/gdb-6.8-bz436037-reg-no-longer-active.patch?revision=1.1

That sounds like something we would want to have in buildroot - Care
to make a patch?

-- 
Bye, Peter Korsgaard
