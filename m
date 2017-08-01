From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 23:38:48 +0200
Subject: [Buildroot] [PATCH 0/4] Update binutils package
In-Reply-To: <20170731212753.5ab4e326@windsurf.home>
References: <20170729130906.2140-1-thomas.petazzoni@free-electrons.com>
 <20170731212753.5ab4e326@windsurf.home>
Message-ID: <20170801233848.5a57263c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Jul 2017 21:27:53 +0200, Thomas Petazzoni wrote:

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

Since only Waldemar commented positively on the move to binutils 2.28,
I've merged the two remaining patches in this series.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
