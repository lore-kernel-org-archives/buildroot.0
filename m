From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Jan 2010 23:11:39 +0100
Subject: [Buildroot] PATCH: Add more config options to alsa, bump version
In-Reply-To: <4B61D25F.9040400@carallon.com> (William Wagner's message of
	"Thu, 28 Jan 2010 18:07:27 +0000")
References: <4B603125.6070002@carallon.com> <4B61D25F.9040400@carallon.com>
Message-ID: <87sk9plw10.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "William" == William Wagner <will_wagner@carallon.com> writes:

 William> Have revised patch to fix the typo

The removal of .la / .a files is wrong. That's globally handled in
target-finalize if HAVE_DEVFILES isn't enabled. There were also some
whitespace issues.

I've fixed both and committed - Thanks.

-- 
Bye, Peter Korsgaard
