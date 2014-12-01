From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 Dec 2014 22:41:18 +0100
Subject: [Buildroot] [PATCH 1/1] Adding package janus-gateway and
 dependencies
In-Reply-To: <20141201223409.7cd48798@free-electrons.com>
References: <CAEbDrgmtDX9uRt2yrA7ZBVZstog_vSt4AMAEO1D0zJVLFE_Zxg@mail.gmail.com>
 <20141201204722.GC4150@free.fr>
 <20141201223409.7cd48798@free-electrons.com>
Message-ID: <20141201214118.GD4150@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-01 22:34 +0100, Thomas Petazzoni spake thusly:
> On Mon, 1 Dec 2014 21:47:22 +0100, Yann E. MORIN wrote:
> > On 2014-12-01 19:37 +0000, Gregory Dymarek spake thusly:
> > > This is a set of packages that are needed to compile janus-gateway:
> > > ding-libs
> > > gengetopt
> > > janus-gateway
> > > libnice
> > > libsrtp
> > > libwebsock
> > > sofia-sip
> > > 
> > > Signed-off-by: gregd <gregd72002@gmail.com>
> > 
> > I already started discussing this patch with Gregory on IRC:
> > 
> >   - this patch is broken because the mailer warped long lines.
> > 
> >   - it should have been split in different patches, one for each new
> >     package
> > 
> >   - indentation is incorrect in the help texts (spaces vs. tabs)
> > 
> > Gregory is resending this patch as-is so I can apply it and further work
> > on it.
> > 
> > More comments on this patch can be done in the followup respin. ;-)
> 
> While I certainly do appreciate a lot the fact that you're willing to
> take over the work of Gregory and do the final polishing, wouldn't it
> be better to teach people how to fish rather than fish for them? I.e
> make the comments, and let Gregory rework the patch series until it is
> OK for merging. Of course, this is only true if Gregory is
> willing/interested in pushing this set of patches up to the point where
> it becomes acceptable upstream.

I agree with you.

However, Gregory has done the base work, and that's nice. He already
incorporated comments I made earlier on IRC (in the past few days).

So, I was just gonna put the series in shape and fix the obvious that
does not take too much time, and respin so Gregory can take back the
work on its own.

Basically, a kind of reward for him to do the base work, and entice him
to continue on the series. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
