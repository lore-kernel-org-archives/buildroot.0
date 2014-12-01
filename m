From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Dec 2014 22:34:09 +0100
Subject: [Buildroot] [PATCH 1/1] Adding package janus-gateway and
 dependencies
In-Reply-To: <20141201204722.GC4150@free.fr>
References: <CAEbDrgmtDX9uRt2yrA7ZBVZstog_vSt4AMAEO1D0zJVLFE_Zxg@mail.gmail.com>
 <20141201204722.GC4150@free.fr>
Message-ID: <20141201223409.7cd48798@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 1 Dec 2014 21:47:22 +0100, Yann E. MORIN wrote:
> Gregory, All,
> 
> On 2014-12-01 19:37 +0000, Gregory Dymarek spake thusly:
> > This is a set of packages that are needed to compile janus-gateway:
> > ding-libs
> > gengetopt
> > janus-gateway
> > libnice
> > libsrtp
> > libwebsock
> > sofia-sip
> > 
> > Signed-off-by: gregd <gregd72002@gmail.com>
> 
> I already started discussing this patch with Gregory on IRC:
> 
>   - this patch is broken because the mailer warped long lines.
> 
>   - it should have been split in different patches, one for each new
>     package
> 
>   - indentation is incorrect in the help texts (spaces vs. tabs)
> 
> Gregory is resending this patch as-is so I can apply it and further work
> on it.
> 
> More comments on this patch can be done in the followup respin. ;-)

While I certainly do appreciate a lot the fact that you're willing to
take over the work of Gregory and do the final polishing, wouldn't it
be better to teach people how to fish rather than fish for them? I.e
make the comments, and let Gregory rework the patch series until it is
OK for merging. Of course, this is only true if Gregory is
willing/interested in pushing this set of patches up to the point where
it becomes acceptable upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
