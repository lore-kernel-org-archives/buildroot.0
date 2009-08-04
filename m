From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Aug 2009 11:37:13 +0200
Subject: [Buildroot] float, va_arg, printf on x86_64
In-Reply-To: <20090804093009.28470@gmx.net> (bbj's message of "Tue\,
	04 Aug 2009 11\:30\:09 +0200")
References: <20090804093009.28470@gmx.net>
Message-ID: <87tz0nrkc6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bbj17" == bbj17  <bbj17@gmx.de> writes:

 bbj17> Hi,

 bbj17> I found the bug. IT seems to be a bad combination of Host-GCC and Target-GCC:

Hmm, strange, but 4.2.1 is quite old (you should atleast consider to
upgrade to 4.2.4).

Thanks for letting us know.

-- 
Bye, Peter Korsgaard
