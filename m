From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 02 May 2014 14:58:11 +0200
Subject: [Buildroot] [PATCH] manual: fix C++ suport in libc case,
	fix indentation
In-Reply-To: <1399027768-28337-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 2 May 2014 12:49:28 +0200")
References: <1399027768-28337-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87d2fwpcbg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > The manual has this sentence for the dependency on a C library *and* a
 > toolchain feature:

 >     foo needs an (e)glibc toolchain, or foo needs an (e)glibc toolchain
 >     w/ C++ support

 > And then, just below, the comment text for C++ is just 'C++', not
 > 'C++ support'.

 > Fix that, and add a bit of indentation too.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
