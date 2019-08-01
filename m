From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 10:18:41 +0200
Subject: [Buildroot] [PATCH 1/2 v2] arch/csky: restrict ck610 to the
 C-SKY gcc port
In-Reply-To: <fd5eb24d78fc8cd65c3707f581e19c4662ed3f20.1563483980.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 18 Jul 2019 23:06:27 +0200")
References: <cover.1563483980.git.yann.morin.1998@free.fr>
 <fd5eb24d78fc8cd65c3707f581e19c4662ed3f20.1563483980.git.yann.morin.1998@free.fr>
Message-ID: <875znh47tq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > As Guo explained, upstream gcc does not support abi-v1 (only abi-v2), but
 > ck610 needs abi-v1 [0] [1]

 > To simplify things, we make the whole C-SKY architecture require gcc-9
 > or later, and add a single exception in gcc to force the ck610 to use
 > the C-SKY port.

 > Note that this does not change the default gcc version to be used for
 > C-SKY: the C-SKY port is still always the default one; the gcc-9 version
 > is only proposed as an alternative (except for ck610, of course).

 > [0] http://lists.busybox.net/pipermail/buildroot/2019-July/254386.html
 > [1] package/Makefile.in#73

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Guo Ren <guoren@kernel.org>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Acked-by: Guo Ren <guoren@kernel.org>

 > ---
 > Changes v1 -> v2:
 >   - expand commit log to state that the default does not change  (Guo)
 >   - fix typoes in comments
 >   - add Guo's acked-by

Committed, thanks.

-- 
Bye, Peter Korsgaard
