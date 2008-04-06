From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Apr 2008 14:34:37 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <03b601c897df$7b07f7b4$85f0af0a@corp.atmel.com> (Ulf Samuelsson's
	message of "6 Apr 2008 12\:07\:16 +0000")
References: <03b601c897df$7b07f7b4$85f0af0a@corp.atmel.com>
Message-ID: <874paf88ma.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Samuelsson, Ulf <ulf.samuelsson@atmel.com> writes:

 Ulf> I am not happy with menuconfig
 Ulf> so either this or revert your
 Ulf> patch.
 Ulf> Your choice...

Bah, as I said back then xconfig is not a good default. It has
additional dependencies we don't provide/check for and as we already
use menuconfig interface for buildroot that's the only sane default.

The default values should work out of the box!

But as it's just a default, you can always change it locally if you
prefer xconfig.

-- 
Bye, Peter Korsgaard
