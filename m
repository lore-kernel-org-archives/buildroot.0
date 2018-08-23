From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 22:32:50 +0200
Subject: [Buildroot] [PATCH 4/5 v2] package/acl: bump version
In-Reply-To: <301ec6ce94e85f26041c1d2855ff315bddb58cde.1530368468.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 30 Jun 2018 16:21:26 +0200")
References: <cover.1530368468.git.yann.morin.1998@free.fr>
 <301ec6ce94e85f26041c1d2855ff315bddb58cde.1530368468.git.yann.morin.1998@free.fr>
Message-ID: <87a7pc258t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Of most interest is the build system overhaul, and the drop of the
 > dependency on attr-provided <attr/xattr.h> in favour of the
 > system-provided <sys/xattr.h>.

 > That last bit meaning that we will be able to bump attr.

 > We can drop our patches: static is now natively supported thanks to
 > the use of libtool, and the internal symbols patch was a backport,
 > and finally, our install patch is superseded by the use of autotools.

 > The option to disable NLS has changed, so update accordingly.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
