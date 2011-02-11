From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Feb 2011 10:35:19 +0100
Subject: [Buildroot] [PATCH] Add package xmlstarlet
In-Reply-To: <AANLkTinQpDAy5HL+Eky5TAVe623bT7BrZaENutSR0FE9@mail.gmail.com>
	(Nate Ford's message of "Tue, 8 Feb 2011 11:18:53 -0500")
References: <AANLkTinQpDAy5HL+Eky5TAVe623bT7BrZaENutSR0FE9@mail.gmail.com>
Message-ID: <87zkq2ewx4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nate" == Nate Ford <nford@westpond.com> writes:

 Nate> This adds xmlstarlet, a command line XML processing tool. http://
 Nate> xmlstar.sourceforge.net/

 Nate> This is my first patch contribution to an open source project, so be gentle :P

Thanks, committed.

There were a few minor issues (it doesn't make sense to link statically
to the XML libs when we install the shared libs in target and iconv is
only needed if the toolchain doesn't have locale support), but I've
fixed that.


-- 
Bye, Peter Korsgaard
