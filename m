From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 31 Jul 2017 21:29:24 +0200
Subject: [Buildroot] [PATCH 0/4] Update binutils package
In-Reply-To: <20170731212753.5ab4e326@windsurf.home>
References: <20170729130906.2140-1-thomas.petazzoni@free-electrons.com>
 <20170731212753.5ab4e326@windsurf.home>
Message-ID: <20170731192924.GH31395@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sat, 29 Jul 2017 15:09:02 +0200, Thomas Petazzoni wrote:
> 
> > Thomas Petazzoni (4):
> >   binutils: bump 2.28.x series to 2.28.1
> >   binutils: add support for binutils 2.29
> 
> I've applied those ones, which I believe are not controversial/
> 
> >   binutils: switch to use 2.28.x as the default version
> >   binutils: remove support for 2.26
> 
> I'll hold off on those ones until I get some feedback, to decide
> whether we take them in 2017.08, or wait for 2017.11.

Having 2.28.1 as default seems okay to me.
I use 2.28 mostly and have seen no issues so far.

With binutils 2.29 I have some more issues for glibc toolchains.
I think tomorrow glibc developers will release their next version,
would it make sense to sent a patch or should I wait until
-next is open?

best regards
 Waldemar
