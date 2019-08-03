From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 21:49:18 +0200
Subject: [Buildroot] [PATCH 07/13 v2] core: drop now-useless
 prepare-kconfig rule
In-Reply-To: <0890af03dbffa2d14498dcb5b819a390a7c195a6.1564431589.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 29 Jul 2019 22:19:57 +0200")
References: <cover.1564431589.git.yann.morin.1998@free.fr>
 <0890af03dbffa2d14498dcb5b819a390a7c195a6.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <87lfwa81xd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This rule was added back in 9429e7b698 (core: introduce an intermediate
 > rule before the configurators) when the kconfig-side br2-external file
 > was generated separately from the Makefile-side one.

 > Now that they are generated together very early in the Makefile, we no
 > longer need this intermediate rule. Drop it.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Vadim Kochan <vadim4j@gmail.com>

We still had a reference to this rule in
docs/manual/adding-packages-asciidoc.txt, so I've dropped that as well
and committed, thanks.

-- 
Bye, Peter Korsgaard
