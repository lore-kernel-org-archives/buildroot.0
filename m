From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Feb 2009 15:44:56 +0100
Subject: [Buildroot] problem building openswan using svn-buildroot
In-Reply-To: <20090223143319.GA6299@cbg.dyndns.org> (Steffen Schulz's message
	of "Mon\, 23 Feb 2009 15\:33\:19 +0100")
References: <499E05A7.2070403@unix-beratung.de>
	<87bpsv6ik4.fsf@macbook.be.48ers.dk>
	<49A17E91.7060104@unix-beratung.de>
	<87y6vy5okv.fsf@macbook.be.48ers.dk>
	<20090223102825.GB31413@cbg.dyndns.org>
	<87hc2l2yns.fsf@macbook.be.48ers.dk>
	<20090223143319.GA6299@cbg.dyndns.org>
Message-ID: <874oyl2own.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steffen" == Steffen Schulz <pepe_ml@gmx.net> writes:

 >> Ok, anyone wants to step up and support openswan/strongswan?
 >> Otherwise I think our users are better off if we remove the
 >> package.

 Steffen> I just updated a package I made a few months ago. It
 Steffen> compiles and binaries seem to work, but I can not test it
 Steffen> right now.

Ok.

 Steffen> BTW, it happened the second time now that I could not use the most
 Steffen> recent version of a program because the libtool patch won't apply.
 Steffen> I used the most recent strongswan version that seems to work.
 Steffen> The other package this happened with is gnutls > 2.4.2.

Yes, I've seen that as well. I think we need to come up with a more
robust way of handling the libtool stuff than blindly trying to apply
a patch to whatever version the package includes.

-- 
Bye, Peter Korsgaard
