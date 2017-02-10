From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Feb 2017 11:51:31 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-02-09
In-Reply-To: <2a83fc74-f8c8-639f-74bc-d5032d270b2d@andin.de>
References: <20170210072859.4656F20BAB@mail.free-electrons.com>
 <CALdGskLbBc1Vx9Ju8ZhUJvRa5r6q83=N-qukFygmS-eZz79i8Q@mail.gmail.com>
 <20170210093759.33285cd1@free-electrons.com>
 <A9140E91EDA627489354A41A7EE118CA33CCBD@sv08ultra002.ultratronik.de>
 <20170210112606.1f17fd02@free-electrons.com>
 <2a83fc74-f8c8-639f-74bc-d5032d270b2d@andin.de>
Message-ID: <20170210115131.4894e96b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Feb 2017 11:47:03 +0100, Andreas Naumann wrote:

> > But this raises an even more fundamental issue: there is *nothing* in
> > poppler that indicates it can depend on Qt5. There is some logic for
> > Qt4, but nothing for Qt5.  
> 
> Ok, I see that we have some local patch that makes this explicit. I 
> guess in the given failure it must have been by chance that qt5 was 
> built before poppler and popplers configure automatically detected this.

Exactly.

> > So: the dependency on Qt5 should be made explicit, and should take care
> > of the fact that Qt5 needs C++11 support, and therefore a reasonably
> > recent C++ compiler.
> >
> > Could you work on this?
> >
> > Alternatively, if you don't care/use Qt5 support in Poppler, you can
> > also just pass the appropriate --disable-<foo> option to
> > unconditionally disable Qt5 support.  
> 
> Quite the opposite. I'll try to come up with something in the afternoon.

Excellent, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
