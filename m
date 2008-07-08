From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2008 12:31:52 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <20080708101305.8702C3C697@busybox.net> (ulf@uclibc.org's message
	of "Tue\, 8 Jul 2008 03\:13\:05 -0700 \(PDT\)")
References: <20080708101305.8702C3C697@busybox.net>
Message-ID: <87iqvgpsyv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-07-08 03:13:04 -0700 (Tue, 08 Jul 2008)
 ulf> New Revision: 22687

 ulf> Log:
 ulf> Revert patch which breaks AVR32 build

But I don't get it. From a quick grep of openssl-0.9.7m, I don't see
anything using config.sub / config.guess?

-- 
Bye, Peter Korsgaard
