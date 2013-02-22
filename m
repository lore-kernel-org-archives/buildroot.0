From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Feb 2013 23:46:11 +0100
Subject: [Buildroot] [PATCH 5/6] package/vtun: update to 3.0.3
In-Reply-To: <0e42607923bb818b5edd55c055ddad4cfff4743f.1361143078.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 18 Feb 2013 00:22:31 +0100")
References: <cover.1361143078.git.yann.morin.1998@free.fr>
 <cover.1361143078.git.yann.morin.1998@free.fr>
 <0e42607923bb818b5edd55c055ddad4cfff4743f.1361143078.git.yann.morin.1998@free.fr>
Message-ID: <878v6gc6h8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Against all odds, vtun had a new release sometime last year.
 Yann> Still, the code needs patching:
 Yann>   - the existing patch to fix installation has been refreshed
 Yann>   - the existing patch to fix blowfish header location has been
 Yann>     replaced (see below)
 Yann>   - configure looks in hard-coded, host paths (eg. /usr/include)
 Yann>     without any consideration for scross-compilation
 Yann> --> new patch
 Yann>   - configure.in does not even pass an autoreconf without a
 Yann>     bit of love first (it's written in an ancient dialect that
 Yann>     autoreconf does no longer recognise)
 Yann> --> new patch
 Yann> Remove obsolete, unused, bit-rotting scripts and warning.

Yeah, quite a mess. Committed to next, thanks!

-- 
Bye, Peter Korsgaard
