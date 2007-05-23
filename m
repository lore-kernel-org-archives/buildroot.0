From: Peter Korsgaard <peter.korsgaard@barco.com>
Date: Wed, 23 May 2007 08:56:40 +0200
Subject: [Buildroot] __ctype_b undefined reference after adding
	fontconfig support
In-Reply-To: <015f01c798b4$ac3fdc30$2600a8c0@engineering5> (Christopher
	Reder's message of "Thu, 17 May 2007 13:53:35 -0500")
References: <015f01c798b4$ac3fdc30$2600a8c0@engineering5>
Message-ID: <87d50st4d3.fsf@sleipner.barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "CR" == Christopher Reder <creder@digitalcpt.com> writes:

Hi,

CR> In wanting to use Matchbox as added by Assen, I enabled those
CR> packages which require fontconfig and freetype.  In doing so, I
CR> received the following error which I found as reported a couple of
CR> weeks ago.  I am wondering if anyone else has encountered this and
CR> how to address it.  If there is a version of buildroot that I can
CR> go back to, then I'd be happy to do it.  I have binutils 2.17,
CR> uclibc 0.9.29 and gcc 4.1.2 selected as the toolchain for
CR> buildroot.

fontconfig should be fixed now. Could you give it a try?

-- 
Bye, Peter Korsgaard
