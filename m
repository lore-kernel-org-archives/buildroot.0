From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 21:48:40 +0200
Subject: [Buildroot] [PATCH 06/13 v2] core: generate all br2-external
 files in one go
In-Reply-To: <5578c81c1007dc2654d886c5de7c3c390845d905.1564431589.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 29 Jul 2019 22:19:56 +0200")
References: <cover.1564431589.git.yann.morin.1998@free.fr>
 <5578c81c1007dc2654d886c5de7c3c390845d905.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <87pnlm81yf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When we introduced support for multiple br2-external trees, we
 > introduced two files, one on the Makefile side, needed very early,
 > and one on the kconfig side, needed later in the configuration
 > process. We naturally introduced a two-step generation, as it looked
 > like the simplest and most obvious way.

 > But now, we are on the verge of generating more files on the kconfig
 > side, and it does not make sense to add even more steps to generate
 > them.

 > And even better yet, we can generate both the Makefile-side and
 > kconfig-side files at the same time, in fact.

 > Make it so.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Vadim Kochan <vadim4j@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
