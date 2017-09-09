From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 20:53:59 +0200
Subject: [Buildroot] Issue adding subprocess32 python package to
 buildroot
In-Reply-To: <20170909161401.GC2850@scaer>
References: <CAP3D3ge8ZXFXuB4_V5eSxnKAN=5hKWwYcxT2xRqM6HUOp39pUg@mail.gmail.com>
 <20170909161401.GC2850@scaer>
Message-ID: <20170909205359.2346ba4e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 9 Sep 2017 18:14:01 +0200, Yann E. MORIN wrote:

> On 2017-09-08 15:18 +0100, Paul Gildea spake thusly:
> > I am trying to install subprocess32 with my python 2.7 installation via
> > buildroot. It's an older version of buildroot and doesn't have
> > python-package,  
> 
> python-package was introduced in December 2013, so appeared in Buildroot
> 2014.02. This means you are using  version that is almost 4 years old
> now.
> 
> And below, we can see that you are using the GENTARGETS infrastructure.
> This was removed in July 2012, now more than 5 years ago...
> 
> We can't help on such an old version.
> 
> I would suggest that you upgrade to at least our first LTS version,
> 2017.02, or to the latest release, 2017.08.

I already replied exactly the same thing, to the same person, asking
the same question on Stack Overflow:
https://stackoverflow.com/questions/46079968/issue-importing-subprocess32.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
