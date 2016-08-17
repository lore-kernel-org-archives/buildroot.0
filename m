From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 15:03:55 +0200
Subject: [Buildroot] [PATCH v2] m68k: flat one memory region works with
	small kernel patch
In-Reply-To: <20160817063754.GA8808@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Wed, 17 Aug 2016 08:37:54 +0200")
References: <20160817063754.GA8808@waldemar-brodkorb.de>
Message-ID: <8737m3sg1w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Greg Ungerer fixed recently a bug in the Linux kernel, which
 > allows to use one memory region again.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > v1 -> v2:
 >  - fix stupid logic error, spotted by Baruch

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
