From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 21:48:11 +0200
Subject: [Buildroot] [PATCH 04/13 v2] core: rename generated
 .br-external.mk file
In-Reply-To: <e1e32262b69c1e7806e8af842583e91e825bd506.1564431589.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 29 Jul 2019 22:19:54 +0200")
References: <cover.1564431589.git.yann.morin.1998@free.fr>
 <e1e32262b69c1e7806e8af842583e91e825bd506.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <87y30a81z8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Now that the two (all of them!) br2-external related files are generated
 > in the same location, it makes sense they are named after the same
 > pattern.

 > When initial support for (then single) br2-external trees was added back
 > in a4239f7fd1 (core: introduce the BR2_EXTERNAL variable), it was not
 > clear-cut why that file was not named with a br2 prefix.

 > So rename it now.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Vadim Kochan <vadim4j@gmail.com>

 > ---
 > Changes v1 -> v2:
 >   - update manual accordingly

 > ---
 > The reason for the original naming is probably because of the long
 > undocumented (except buried in an old dev-days report) and mostly
 > never-obeyed rule that internal variables should be prefixed with
 > BR_ not BR2_, the latter being reserved for user-facing variables,
 > and thus the same was thought for the generated file. Or maybe not...

Possibly ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
