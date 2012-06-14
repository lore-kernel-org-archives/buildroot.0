From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Jun 2012 08:07:36 +0200
Subject: [Buildroot] [PATCH 7/7] automatically set PARALLEL_JOBS when
	BR2_JLEVEL is 0
In-Reply-To: <1339631041.32578.9.camel@doorstop.aus.2wire.com> (Nathan Lynch's
 message of "Wed, 13 Jun 2012 18:44:01 -0500")
References: <1339466983-19786-1-git-send-email-ntl@pobox.com>
 <1339466983-19786-8-git-send-email-ntl@pobox.com>
 <4FD921C9.4020302@mind.be>
 <1339631041.32578.9.camel@doorstop.aus.2wire.com>
Message-ID: <87ipeuwhnb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nathan" == Nathan Lynch <ntl@pobox.com> writes:

 >> In my experience, you need 2 times the number of CPUs to fully utilize
 >> the processor because most compilations have long iowait latencies.

 Nathan> Yeah.  I'm happy to make this change, assuming others agree?

I was going to say something like that as well, so yes please.

-- 
Bye, Peter Korsgaard
