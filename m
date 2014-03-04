From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 16:23:10 +0100
Subject: [Buildroot] [PATCH 1/1] pyrex: new package
In-Reply-To: <OFDE37491E.EE5530A4-ON86257C91.00539055-86257C91.0053E4B7@rockwellcollins.com>
References: <1379700560-10738-1-git-send-email-mlweber1@rockwellcollins.com>
 <20140303220417.6835ec44@skate>
 <OFDE37491E.EE5530A4-ON86257C91.00539055-86257C91.0053E4B7@rockwellcollins.com>
Message-ID: <20140304162310.444d5eea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt,

On Tue, 4 Mar 2014 09:16:20 -0600, mlweber1 at rockwellcollins.com wrote:

> > If I understand correctly what Pyrex is, it is a tool that generates C
> > code that then needs to be compiled with gcc. At least that's what I
> > understand from http://ldots.org/pyrex-guide/2-compiling.html.
> > 
> > Therefore, I am wondering how useful it is to support the installation
> > of python-pyrex to the target, while we don't have the support for
> > providing a compiler on the target.
> > 
> You are correct.  Our use case was just as a host tool to aid in our
> application build using the sysroot and not on target.

Ok, but then python-pyrex should be packaged as a host package, not as
a target package as you did, no?

Do you intend to resend an updated version which packages python-pyrex
as a host tool instead?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
