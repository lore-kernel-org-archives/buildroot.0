From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 31 Mar 2010 10:50:30 +0200
Subject: [Buildroot] [PATCH] external toolchain: fix sysroot location if
	the toolchain was	moved
In-Reply-To: <20100324224238.1489.74099.stgit@roazhon.bzh.lan> (Yann
	E. MORIN's message of "Wed, 24 Mar 2010 23:42:42 +0100")
References: <20100324224238.1489.74099.stgit@roazhon.bzh.lan>
Message-ID: <87y6h8an8p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
 Yann> Sysrooted toolchain can be relocated. In this case, the sysroot is no
 Yann> longer located at the place it was configured at.

 Yann> Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
