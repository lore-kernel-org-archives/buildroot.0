From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 May 2014 21:38:20 +0200
Subject: [Buildroot] [PATCH 01/12] boot/syslinux: needs an ia32-capable
	compiler
In-Reply-To: <30fe3eb3a07f61c27d1f6ddcd4f97ec30f84305e.1399050467.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 2 May 2014 19:10:27 +0200")
References: <cover.1399050467.git.yann.morin.1998@free.fr>
 <30fe3eb3a07f61c27d1f6ddcd4f97ec30f84305e.1399050467.git.yann.morin.1998@free.fr>
Message-ID: <871twaodoz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > The pxelinux and isolionux images are 32-bit binaries, so we need a
 > compiler that can generate them (ie. a compiler that understands -m32).

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Frank Hunleth <fhunleth@troodon-software.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
 > Tested-by: Romain Naour <romain.naour@openwide.fr>

 > ---
 > Changes v1 -> v2:
 >   - explain why we need it  (Arnout)

Committed patch 1-4, thanks.

-- 
Bye, Peter Korsgaard
