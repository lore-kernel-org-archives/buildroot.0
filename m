From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Dec 2009 12:18:58 +0100
Subject: [Buildroot] Support for ATMEL Sam9G45
In-Reply-To: <000701ca78bf$45d3b730$d17b2590$@com> (Barry Bridges's message of
	"Wed, 9 Dec 2009 11:03:43 -0000")
References: <000701ca78bf$45d3b730$d17b2590$@com>
Message-ID: <87638gmm3h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Barry" == Barry Bridges <barry@disignconsultants.com> writes:

 Barry> Hi all,
 Barry> New to the world of buildroot and this mailing list.

 Barry> Just wondering if support for the ATMEL SAM9G45 was on the
 Barry> horizon or not.

There's no specific 9g45 support in BR, no. Ulf said he was working on
something, but I haven't heard from him for several months.

This is not such a big deal though, as the ARM core is supported and
there's (basic) 9g45 support in the mainline kernel.

I'll start working on a 9g45 platform early next year, and don't expect
any real problems.

-- 
Bye, Peter Korsgaard
