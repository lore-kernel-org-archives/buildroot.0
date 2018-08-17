From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 18:57:50 +0200
Subject: [Buildroot] [PATCH] package/m4: fix build in host with
 glibc-2.28
In-Reply-To: <20180817123803.13807-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 17 Aug 2018 14:38:03 +0200")
References: <20180817123803.13807-1-yann.morin.1998@free.fr>
Message-ID: <87r2ixnd69.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > glibc-2.28 did quite some lifting in their headers, which breaks the
 > way some packages were detecting glibc, like gnulib.

 > However, packages do bundle gnulib (it was meant to be bundled),
 > and so does m4.

:/

Committed, thanks.

-- 
Bye, Peter Korsgaard
