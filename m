From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Wed, 29 Feb 2012 23:38:53 -0200
Subject: [Buildroot] mesa3d fails
In-Reply-To: <201202292317.54748.arnout@mind.be>
References: <20120228200231.7f26116f@gmail.com>
 <201202282304.16308.arnout@mind.be>
 <20120229020844.08f20f46@gmail.com>
 <201202292317.54748.arnout@mind.be>
Message-ID: <20120229233853.1178ff2d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 Feb 2012 23:17:54 +0000
Arnout Vandecappelle <arnout@mind.be> wrote:
> On Wednesday 29 February 2012 04:08:44 Ismael Luceno wrote:
> > >  Works for me...  Does config.log report anything about why it
> > > fails? Is configure called with the correct PKG_CONFIG variable?
> > > Can you do a host/usr/bin/pkg-config --list-all to see if it
> > > finds libdrm?
> > > 
> > 
> >   $ ./output/host/usr/bin/pkg-config --modversion libdrm
> >   2.4.19
> > 
> > Since mesa3d is using AUTOTARGETS, I guess it's getting the right
> > PKG_CONFIG. I'll check tomorrow, to be sure.
> 
>  Maybe you can hack mesa3d's configure to print PKG_CONFIG, and the
> exact pkg-config command used for libdrm.

Weird... this time it worked. Maybe something got corrupted last
time... sadly I didn't kept a copy :(.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120229/8f9d533a/attachment.asc>
