From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Nov 2008 15:37:38 +0100
Subject: [Buildroot] How to build a gcc-3.3 toolchain
In-Reply-To: <1225722832.28602.1282706045@webmail.messagingengine.com> (Adam
	McLaurin's message of "Mon\, 03 Nov 2008 09\:33\:52 -0500")
References: <1225463596.29685.1282290569@webmail.messagingengine.com>
	<87ej1uz0yc.fsf@macbook.be.48ers.dk>
	<1225722832.28602.1282706045@webmail.messagingengine.com>
Message-ID: <87iqr4c1u5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam McLaurin <buildroot@irotas.net> writes:

 Adam> On Sun, 02 Nov 2008 14:55:55 +0100, "Peter Korsgaard"
 Adam> <jacmet@uclibc.org> said:
 >> You could probably change the existing 3.4.6 support (remember to
 >> enable BR2_DEPRECATED) to compile a 3.3 gcc instead.

 Adam> Thanks for the response.

 Adam> Should I start by copying everything in 'toolchain/gcc/3.4.6' to
 Adam> 'toolchain/gcc/3.3.6', or create the 3.3.6 directory clean and add
 Adam> patches as necessary? I'm not sure how well those patches will backport
 Adam> to 3.3.6.

I don't quite know either, but my guess is that they will more-or-less
apply.

-- 
Bye, Peter Korsgaard
