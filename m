From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Nov 2009 14:27:54 +0100
Subject: [Buildroot] br-2009.08 X11 problem
In-Reply-To: <4AFDA449.6020005@cs.ucsb.edu> (Roman Chertov's message of "Fri\,
	13 Nov 2009 10\:24\:09 -0800")
References: <4AFDA449.6020005@cs.ucsb.edu>
Message-ID: <871vjzzzmt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roman" == Roman Chertov <rchertov@cs.ucsb.edu> writes:

 Roman> Hello,
 Roman> I am using br-2009.08 and I am trying to build x-org server.  X11
 Roman> compilation fails because openssl/sha.h is not found:

 Roman> glyph.c:30:25: error: openssl/sha.h: No such file or directory
 Roman> glyph.c: In function 'HashGlyph':
 Roman> glyph.c:207: error: 'SHA_CTX' undeclared (first use in this function)

Hmm, I'm pretty sure it worked for me last time I tried. Could you post
your .config so I can reproduce?

-- 
Bye, Peter Korsgaard
