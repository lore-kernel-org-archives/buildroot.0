From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 16:58:50 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <48721947.9020804@atmel.com> (Ulf Samuelsson's message of "Mon\,
	07 Jul 2008 15\:25\:27 +0200")
References: <20080704222950.E76B63C61F@busybox.net>
	<873aml7ru0.fsf@macbook.be.48ers.dk> <48721947.9020804@atmel.com>
Message-ID: <87od593fmd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> Yes, but that is really not a good implementation.
 Ulf> The MAKELEVEL has really nothing to do with what you
 Ulf> want to use it for, it just happens to work, but
 Ulf> this implementation is easily broken.

I agree that it isn't particular nice, and I have no problem with it
being replaced with a proper fix. I don't think your NO_DOWNLOAD
solution is that though.

-- 
Bye, Peter Korsgaard
