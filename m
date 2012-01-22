From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Jan 2012 21:57:42 +0100
Subject: [Buildroot] [PATCH v4] bash: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <201201202154.40800.arnout@mind.be> (Arnout Vandecappelle's
 message of "Fri, 20 Jan 2012 21:54:40 +0100")
References: <CA+gTGJGnxMiY9NKWhFsvsKhZT95N2QV_V2-XzDMN7aJMZRo3uA@mail.gmail.com>
 <201201191327.37010.arnout@mind.be>
 <87k44mixzc.fsf@macbook.be.48ers.dk>
 <201201202154.40800.arnout@mind.be>
Message-ID: <87pqebh2ux.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> No, a lot of packages break if you start tweaking the uClibc
 >> configuration. I don't want to add configuration option of all of these,
 >> and really consider the custom uClibc config stuff to be an advanced
 >> "you-have-to-know-what-you-are-doing" option.

 Arnout>  I agree; however:

 Arnout> toolchain/toolchain-crosstool-ng/uClibc.config:# UCLIBC_HAS_HEXADECIMAL_FLOATS is not set

*Grumble* Why is it again we cannot use the same uClibc config for ctng
as for the internal toolchain?

-- 
Bye, Peter Korsgaard
