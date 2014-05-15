From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 May 2014 18:24:13 +0200
Subject: [Buildroot] [PATCH] package/cairo: uses fork(),
 so requires an MMU
In-Reply-To: <20140515100251.0f503b8d@free-electrons.com>
References: <1400104601-31625-1-git-send-email-yann.morin.1998@free.fr>
 <20140514221537.GC3495@free.fr> <20140515074408.GA11475@pc-eric>
 <20140515100251.0f503b8d@free-electrons.com>
Message-ID: <20140515162413.GA3463@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-15 10:02 +0200, Thomas Petazzoni spake thusly:
> On Thu, 15 May 2014 09:44:08 +0200, Eric Le Bihan wrote:
> > On Thu, May 15, 2014 at 12:15:37AM +0200, Yann E. MORIN wrote:
> > > On 2014-05-14 23:56 +0200, Yann E. MORIN spake thusly:
> > > > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > > >
> > > > Fixes:
> > > >     http://autobuild.buildroot.net/results/038/038371cc8548b3d39d8174289bedc9aae4076303/
> > >
> > > Also fixes:
> > >     http://autobuild.buildroot.net/results/d93/d9374c1bd08eae5db60e6939ce5e9e4c8ff8cbd5/
> > >     http://autobuild.buildroot.net/results/574/5746e7e3b2bc36f31dee1acf71e59dc4d6c90af2/
> > >     http://autobuild.buildroot.net/results/b66/b66d7125ea7e10313221462097ae6c22ede963e5/
> > >     [...]
> > 
> > A few weeks ago, I posted a fix to cairo for these issues:
> > 
> > http://patchwork.ozlabs.org/patch/342715/
> > 
> > The problem occurs on one of the test program, not on cairo itself, so cairo
> > should be usable on Blackfin (I do not own one, so I have not tested it).
> > 
> > I opened a bug at freedesktop.org too:
> > 
> > https://bugs.freedesktop.org/show_bug.cgi?id=78709
> 
> Yep, I agree Eric's patch is better. I've therefore marked Yann's patch
> as rejected (hope you won't mind Yann).

He, of course not! I even was doubtful of that patch to begin with
anyway. I just forgot to mention it in a '---' note.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
