From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2009 10:01:19 +0200
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <20091007183157.GD23847@mx.loc>
References: <20091007162422.GI10261@mx.loc>
	<87ocojkqlh.fsf@macbook.be.48ers.dk>
	<20091007183157.GD23847@mx.loc>
Message-ID: <20091009100119.69ad93db@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 7 Oct 2009 20:31:57 +0200,
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> a ?crit :

> calling the individual targets can be dropped, yes. I just didn't
> remove it (yet).

Agreed. The <pkg>-clean targets of the packages are fragile anyway.

> >dirclean already gets rid of those dirs.
> 
> s/those dirs/TOOLCHAIN_DIR/
> ack.

and BUILD_DIR.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
