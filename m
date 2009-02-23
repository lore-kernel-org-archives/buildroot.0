From: Steffen Schulz <pepe_ml@gmx.net>
Date: Mon, 23 Feb 2009 15:33:19 +0100
Subject: [Buildroot] problem building openswan using svn-buildroot
In-Reply-To: <87hc2l2yns.fsf@macbook.be.48ers.dk>
References: <499E05A7.2070403@unix-beratung.de>
	<87bpsv6ik4.fsf@macbook.be.48ers.dk>
	<49A17E91.7060104@unix-beratung.de>
	<87y6vy5okv.fsf@macbook.be.48ers.dk>
	<20090223102825.GB31413@cbg.dyndns.org>
	<87hc2l2yns.fsf@macbook.be.48ers.dk>
Message-ID: <20090223143319.GA6299@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 090223 at 12:15, Peter Korsgaard wrote:
> Steffen Schulz wrote:
>  Steffen> It's far from small though.

On the bright side, it seems to be very modular..

> Ok, anyone wants to step up and support openswan/strongswan? Otherwise
> I think our users are better off if we remove the package.

I just updated a package I made a few months ago. It compiles and
binaries seem to work, but I can not test it right now.


BTW, it happened the second time now that I could not use the most
recent version of a program because the libtool patch won't apply.
I used the most recent strongswan version that seems to work.
The other package this happened with is gnutls > 2.4.2.


/steffen
-- 
Chair for System Security               mail: steffen.schulz at rub.de
Ruhr-University Bochum                  phone:  +49 (0)234 32 29177
Key fingerprint = B805 57BE E4AF 0104 CC51 77A1 CE6F 8D46 A04D 7875
-------------- next part --------------
A non-text attachment was scrubbed...
Name: strongswan4.2.9.patch
Type: text/x-diff
Size: 6865 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090223/c0fc6124/attachment-0001.bin>
