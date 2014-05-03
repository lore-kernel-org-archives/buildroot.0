From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 May 2014 21:48:42 +0200
Subject: [Buildroot] [PATCH 06/12] package/ucl: new package
In-Reply-To: <49966b58132dbede2fcd34a4a91dda3ec317a149.1399050467.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 2 May 2014 19:10:32 +0200")
References: <cover.1399050467.git.yann.morin.1998@free.fr>
 <49966b58132dbede2fcd34a4a91dda3ec317a149.1399050467.git.yann.morin.1998@free.fr>
Message-ID: <87sioqmyn9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Frank Hunleth <fhunleth@troodon-software.com>
 > UCL implements a number of compression algorithms that achieve an
 > excellent compression ratio while allowing *very* fast decompression.
 > Decompression requires no additional memory.

 > This is needed for UPX, which is needed for syslinux 6.x.

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 > [yann.morin.1998 at free.fr: don't add a menuconfig entry, since it
 >  currently is for internal use only]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Tested-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
