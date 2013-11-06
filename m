From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 23:04:26 +0100
Subject: [Buildroot] [PATCH 1/5] package/nut: new package
In-Reply-To: <28a8f14c7333ebc9e1836512f980f3e5b4d33dc0.1383693880.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 6 Nov 2013 00:28:16 +0100")
References: <cover.1383693880.git.yann.morin.1998@free.fr>
 <28a8f14c7333ebc9e1836512f980f3e5b4d33dc0.1383693880.git.yann.morin.1998@free.fr>
Message-ID: <871u2tkx05.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > 'nut' are the Network UPS Tools.

 > [Note: original patch from Dallas, but completely revamped
 >  by Yann, so nothing remains from the original patch, but two
 >  variable names.]

 > Signed-off-by: Dallas Clement <dallas.a.clement@gmail.com>
 > [yann.morin.1998 at free.fr: refresh patch, use latest version,
 >     add license, fix commit message, add dependencies, fix
 >     runtime path, fix libs-config, move to 'system utils']

I would probably have put it under hardware handling or networking
myself, but OK - Committed, thanks.

-- 
Bye, Peter Korsgaard
