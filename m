From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Wed, 29 Feb 2012 02:08:44 -0200
Subject: [Buildroot] mesa3d fails
In-Reply-To: <201202282304.16308.arnout@mind.be>
References: <20120228200231.7f26116f@gmail.com>
 <201202282304.16308.arnout@mind.be>
Message-ID: <20120229020844.08f20f46@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Feb 2012 23:04:16 +0000
Arnout Vandecappelle <arnout@mind.be> wrote:
> On Tuesday 28 February 2012 22:02:31 Ismael Luceno wrote:
> > I'm getting the following error:
> > 
> > > checking for LIBDRM... configure: error: Package requirements
> > > (libdrm >= 2.4.3) were not met:
> > >
> > > No package 'libdrm' found
> > <...>
> > 
> > But libdrm 2.4.19 is installed... anyone ran into this?
> 
>  Works for me...  Does config.log report anything about why it fails?
> Is configure called with the correct PKG_CONFIG variable?  Can you do
> a host/usr/bin/pkg-config --list-all to see if it finds libdrm?
> 

  $ ./output/host/usr/bin/pkg-config --modversion libdrm
  2.4.19

Since mesa3d is using AUTOTARGETS, I guess it's getting the right
PKG_CONFIG. I'll check tomorrow, to be sure.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120229/4642a4f5/attachment.asc>
