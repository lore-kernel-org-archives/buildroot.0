From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Jan 2012 09:23:19 +0100
Subject: [Buildroot] [PATCH v4] bash: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <201201191327.37010.arnout@mind.be> (Arnout Vandecappelle's
 message of "Thu, 19 Jan 2012 13:27:36 +0100")
References: <CA+gTGJGnxMiY9NKWhFsvsKhZT95N2QV_V2-XzDMN7aJMZRo3uA@mail.gmail.com>
 <1326975728-25580-1-git-send-email-arnout@mind.be>
 <201201191327.37010.arnout@mind.be>
Message-ID: <87k44mixzc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On Thursday 19 January 2012 13:22:08 Arnout Vandecappelle (Essensium/Mind) wrote:
 >> +   bash_cv_printf_a_format=yes

 Arnout>  Actually this one depends on UCLIBC_HAS_HEXADECIMAL_FLOATS, so
 Arnout> maybe that should be kept as a configure option?

No, a lot of packages break if you start tweaking the uClibc
configuration. I don't want to add configuration option of all of these,
and really consider the custom uClibc config stuff to be an advanced
"you-have-to-know-what-you-are-doing" option.

-- 
Bye, Peter Korsgaard
