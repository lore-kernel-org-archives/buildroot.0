From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 18:07:32 +0200
Subject: [Buildroot] [PATCH 5/5] docs/manual: document hashes for
	license files
In-Reply-To: <48ad498d1bf7e08c8120090942e711a1d2320c32.1498428166.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 26 Jun 2017 00:03:41 +0200")
References: <cover.1498428166.git.yann.morin.1998@free.fr>
 <48ad498d1bf7e08c8120090942e711a1d2320c32.1498428166.git.yann.morin.1998@free.fr>
Message-ID: <87bmp17bcr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

 >  # No hash for 1234:
 >  none   xxx                                                              libfoo-1234.tar.gz
 > +
 > +# Hash for license files:
 > +sha1  c47a888f2be626e1197b6f651dee966ef882077d  COPYING
 > +sha1  e101765734390d664b59325b2d644d80d9a6bd9a  doc/COPYING.LGPL

I think it makes more sense to recommend sha256 like for tarballs, so
I've changed this to sha256 and committed, thanks.

-- 
Bye, Peter Korsgaard
