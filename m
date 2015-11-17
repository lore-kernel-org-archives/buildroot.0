From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 10:08:45 +0100
Subject: [Buildroot] [PATCH 1/6] package/axfsutils: fix Makefile
In-Reply-To: <1142395b4466f1e5ccbe593ddce1c6e792b6795a.1447449754.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 13 Nov 2015 22:48:47 +0100")
References: <cover.1447449754.git.yann.morin.1998@free.fr>
 <1142395b4466f1e5ccbe593ddce1c6e792b6795a.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <87wpthdmci.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > mkfs.axfs uses zlib, but does not have an rpath to our host dir.
 > That's because:
 >   - we're not passing our host CFLAGS or LDFLAGS
 >   - it is forcibly setting CFLAGS in the Makefile, overriding anything
 >     specified by the user
 >   - it is not using LDFLAGS at all

 > Add two patches so that CFLAGS and LDFLAGS from the environment are
 > used if present.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
