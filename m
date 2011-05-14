From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 May 2011 17:26:42 +0200
Subject: [Buildroot] package management
In-Reply-To: <iqm18j$peg$1@dough.gmane.org>
References: <BANLkTin3bxewdj6C5GYugDTt0Uu9ek4P9w@mail.gmail.com>
	<20110514115341.6706c4f5@surf> <iqm18j$peg$1@dough.gmane.org>
Message-ID: <20110514172642.3798873a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 May 2011 13:49:07 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> > Soon, quite certainly not. Someday, maybe. But there's a lot of
> > work to be done at the package infrastructure level to make this
> > possible. It is not as simple as one might initially think to add
> > this kind of features.
> 
> I'm curious about this.  I'm using ipkg and it works fine.  Opkg seems
> to be based on (and very similar to) ipkg.  What is different about
> opkg that makes it difficult?

Maybe I misunderstood Xianghua initial request. I thought he was asking
for Buildroot to generate ipkg/opkg packages, which Buildroot isn't
capable of doing at the moment. If he is asking about having the
opkg/ipkg-utils installed in a Buildroot system, then obviously it's
fairly easy.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
