From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 21:01:45 +0200
Subject: [Buildroot] [PATCH v1] package/localedef: fix gcc-10.0.1 compile
In-Reply-To: <20200328220750.17732-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 28 Mar 2020 23:07:49 +0100")
References: <20200328220750.17732-1-ps.report@gmx.net>
Message-ID: <871roznmqu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes bug 12711 ([1]):
 >   programs/ld-ctype.c:855:18: error: array subscript 0 is outside the bounds of an interior zero-length array ?unsigned char[0]? [-Werror=zero-length-bounds]
 >     855 |  replace[0].bytes[0] = '?';
 >         |  ~~~~~~~~~~~~~~~~^~~

 > [1] https://bugs.busybox.net/show_bug.cgi?id=12711

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Notes:
 > Patch suggested by Yann E, MORIN, could not test personally (no
 > gcc-10.0.1 available).

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
