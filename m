From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Mar 2021 21:48:14 +0100
Subject: [Buildroot] [PATCH] package/ruby: update hashes
In-Reply-To: <20210307204534.GA2275@scaer>
References: <20210307163455.8023-1-b.bilas@grinn-global.com>
 <20210307204534.GA2275@scaer>
Message-ID: <20210307204814.GB2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2021-03-07 21:45 +0100, Yann E. MORIN spake thusly:
> On 2021-03-07 17:34 +0100, Bartosz Bilas spake thusly:
> > Commit af5226f2fd1292a26f2dfda32f41cbbad7aa4cc6 forgot to update
> > hash of LEGAL and BSDL files.
> I also added a blurb to explain that the changes to those files do not
> impact the licensing information.

And: applied to next, thanks.

Regards,
Yann E. MORIN.

> > Fixes:
> >  - http://autobuild.buildroot.net/results/448/4484fcce51dd2556156631d20b35bbba44abc171/build-end.log
> >  ..
> >  - http://autobuild.buildroot.net/results/c60/c60e5923159b3d66b422eb988f5d49e1c73e8710/build-end.log
> > 
> > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> > ---
> >  package/ruby/ruby.hash | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
> > index b4594fcaba..ec9492aa5e 100644
> > --- a/package/ruby/ruby.hash
> > +++ b/package/ruby/ruby.hash
> > @@ -1,6 +1,6 @@
> >  # https://www.ruby-lang.org/en/news/2020/12/25/ruby-3-0-0-released/
> >  sha256  68bfaeef027b6ccd0032504a68ae69721a70e97d921ff328c0c8836c798f6cb1  ruby-3.0.0.tar.xz
> >  # License files, Locally calculated
> > -sha256  b09ca195d2de08f0aacfa8793d0af62d7681c304b3ef714b75813721823295a6  LEGAL
> > +sha256  274f8d7983052448e7fd691c81043465c92ee6fb7bd8ab3f20a7997862f2778e  LEGAL
> >  sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
> > -sha256  a5e3042dacb53eebda91f3b1caefbfec8307711df8c4ed1ed20e4e97c43307a4  BSDL
> > +sha256  36a9a6e7347214bbba599a412617204e65bff065dcbe5c46f5cb454c80de9eb0  BSDL
> > -- 
> > 2.30.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
