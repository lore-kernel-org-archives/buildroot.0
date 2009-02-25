From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Feb 2009 08:50:15 +0100
Subject: [Buildroot] libpthread compile error
In-Reply-To: <b8bde6ca0902241928w5ca0e73dl4abc290ff7a7cfb0@mail.gmail.com>
	(Vince's message of "Wed\, 25 Feb 2009 11\:28\:35 +0800")
References: <b8bde6ca0902241928w5ca0e73dl4abc290ff7a7cfb0@mail.gmail.com>
Message-ID: <87r61nnefc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vince" == Vince  <hsienwen@gmail.com> writes:

 Vince> Hi all,
 Vince> I try to enable NPTL (uClibc 0.9.30) on my MIPS target but can not build
 Vince> successfully.

NPTL is not supported on MIPS in uClibc 0.9.30.

-- 
Bye, Peter Korsgaard
