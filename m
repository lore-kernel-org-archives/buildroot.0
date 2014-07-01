From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 22:08:00 +0200
Subject: [Buildroot] [PATCH 00/10] Proposals of deprecation/removal,
 mainly affecting toolchain
In-Reply-To: <20140701183614.GZ3981@waldemar-brodkorb.de>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140701183614.GZ3981@waldemar-brodkorb.de>
Message-ID: <20140701220800.0439e136@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 1 Jul 2014 20:36:14 +0200, Waldemar Brodkorb wrote:

> > This set of patches proposes a certain number of deprecation or
> > removal. They are mostly independent from each other:
> > 
> >  - Deprecation of the AVR32 architecture.
> >  - Removal of old binutils versions
> >  - Removal of uClibc 0.9.32.1
> >  - Removal of gcc 4.3.x and 4.6.x
> >  - Removal of gdb 7.4 and 7.5
> >  - Removal of busybox version selection
> > 
> > Let me know what you think about those various proposals.
> 
> I would even suggest to switch binutils to 2.24 as default.
> I had no problems with 2.24 for a long time on different
> architectures. It is not so problematic as gcc, where I am more
> conservative, too.

Yes, I was also thinking about doing this, but since it's really
bumping the default version of a component and not just
removing/deprecating old versions, my plan was to do it as part of
another patch series.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
