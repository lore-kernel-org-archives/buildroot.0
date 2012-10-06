From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Oct 2012 13:05:45 +0200
Subject: [Buildroot] [PATCH] use portable printf instead of echo -e,
	needed for MacOS X buildhost
In-Reply-To: <20120920080117.GA4747@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Thu, 20 Sep 2012 10:01:17 +0200")
References: <20120920080117.GA4747@waldemar-brodkorb.de>
Message-ID: <87wqz3x3li.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <mail@waldemar-brodkorb.de> writes:

 Waldemar> Hi,
 Waldemar> echo -e is not a portable way to do this, better use printf.
 Waldemar> Works with MacOS X.

Committed, thanks.

-- 
Bye, Peter Korsgaard
