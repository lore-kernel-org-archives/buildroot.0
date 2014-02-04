From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 4 Feb 2014 09:55:00 +0000
Subject: [Buildroot] [PATCH] vlc: new package
In-Reply-To: <20140204104031.30100cc9@skate>
References: <1363687526-8469-1-git-send-email-abrodkin@synopsys.com>
 <20140204104031.30100cc9@skate>
Message-ID: <1391507699.2357.50.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 2014-02-04 at 10:40 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Tue, 19 Mar 2013 14:05:26 +0400, Alexey Brodkin wrote:
> > From: Alexey Brodkin <alexey.brodkin@synopsys.com>
> > 
> > Based on "[PATCHv6] vlc: New package" found here http://patchwork.ozlabs.org/patch/171335/
> > 
> > Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
> > Signed-off-by: Alexey Brodkin <alexey.brodkin@synopsys.com>
> > ---
> >  package/multimedia/Config.in                  |    1 +
> >  package/multimedia/vlc/Config.in              |  305 ++++++++++++++++++++
> >  package/multimedia/vlc/vlc-uclibc-fixes.patch |   27 ++
> >  package/multimedia/vlc/vlc.mk                 |  372 +++++++++++++++++++++++++
> >  4 files changed, 705 insertions(+)
> >  create mode 100644 package/multimedia/vlc/Config.in
> >  create mode 100644 package/multimedia/vlc/vlc-uclibc-fixes.patch
> >  create mode 100644 package/multimedia/vlc/vlc.mk
> 
> We have merged a separate proposal to introduce VLC recently, see:
> http://git.buildroot.net/buildroot/tree/package/vlc/.
> 
> It does not include as many features as the patch you were proposing,
> but your patch was introducing so many configuration options at once
> that it was a bit hard to do some good testing of it. Therefore, we've
> merged something slightly simpler, and we invite you do send follow-up
> patches to improve what we have now to support the additional features
> that you think are missing.
> 
> Thanks a lot for your contribution, and sorry for the time it took to
> get a VLC package merged.
> 

This is a very good news - VLC was missign from buildroot for so long
and now it's there.

Frankly these days I don't [need to] use VLC on embedded devices so I
don't really have any requirements for any extra configurability of VLC
in buildroot.

As soon as I face any lacking option I'll submit a new patch.

Thank you guys so much for driving development of U-Boot!

Regards,
Alexey
