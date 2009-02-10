From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 14:51:16 +0100
Subject: [Buildroot] Samba build problem
In-Reply-To: <20090210144234.gd6524zllw0wo4oo@webmail.digibel.be>
	(steve@c2root.be's message of "Tue\,
	10 Feb 2009 14\:42\:34 +0100")
References: <20090210144234.gd6524zllw0wo4oo@webmail.digibel.be>
Message-ID: <871vu65rjf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "steve" == steve  <steve@c2root.be> writes:

 steve> Hi all,
 steve> when I try to compile samba within buildroot, it give me an error 1
 steve> and claims it can not find iconv.h. I have seen this file within the
 steve> source of samba.

Sounds like a libiconv issue. Please post your .config.

-- 
Bye, Peter Korsgaard
