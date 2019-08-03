From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 21:47:47 +0200
Subject: [Buildroot] [PATCH 03/13 v2] core: move generated .br2-external
 kconfig file to $(BASE_DIR)
In-Reply-To: <ac00c031db44bda7c8e5d7124cb91b8232b09a2a.1564431589.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 29 Jul 2019 22:19:53 +0200")
References: <cover.1564431589.git.yann.morin.1998@free.fr>
 <ac00c031db44bda7c8e5d7124cb91b8232b09a2a.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <8736ii9gkc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, that file is generated rather late in the configuration
 > process, so BUILD_DIR is known (and exists) by then.

 > We're soon to generate that file much earlier, at a point where
 > BUILD_DIR is not yet known, so we have two options:
 >  1- declare BUILD_DIR earlier;
 >  2- generate the file in an already-known location.

 > We go with the second solution, as we're already generating a
 > br2-external related file in BASE_DIR, so we can as well generate all
 > br2-external files in the same place.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Vadim Kochan <vadim4j@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
