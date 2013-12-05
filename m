From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Dec 2013 00:11:22 +0100
Subject: [Buildroot] [PATCH] package/openssl: fix coding style
In-Reply-To: <1386280009-27017-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 5 Dec 2013 22:46:49 +0100")
References: <1386280009-27017-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87d2lahp0l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Currently, openssl defines three conditional hooks, but two do not
 > follow our coding rules:
 >   - for PRE_CONFIGURE, the hook is defined in the if-block, but
 >     the _HOOK variable is always set
 >   - for POST_INSTALL_TARGET, the hook is always defined, but the
 >     _HOOK variable is set in the if-block

 > Fix that:
 >   - define the hook in the if-block
 >   - assign the _HOOK variable in the if-block

 > At the same time, get rid of extra empty lines that make it more
 > difficult to read.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
