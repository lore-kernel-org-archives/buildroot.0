From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 29 Jul 2010 10:09:40 -0500
Subject: [Buildroot] [PATCH 1/2] gcc: remove option on SJLJ exceptions
In-Reply-To: <20100729163008.468a211e@surf>
References: <cover.1280385006.git.thomas.petazzoni@free-electrons.com>
	<201007290718.59051.minimod@morethan.org>
	<20100729163008.468a211e@surf>
Message-ID: <201007291009.42670.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu July 29 2010, Thomas Petazzoni wrote:
> Hello Michael,
> 
> On Thu, 29 Jul 2010 07:18:56 -0500
> "Michael S. Zick" <minimod@morethan.org> wrote:
> 
> > mszick at wolf466:~$ lua
> > Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> > > bye = function() return os.exit("String Value") end
> > > bye()
> > stdin:1: bad argument #1 to 'exit' (number expected, got string)
> > stack traceback:
> >         [C]: in function 'exit'
> >         stdin:1: in function 'bye'
> >         stdin:1: in main chunk
> >         [C]: ?
> 
> With the current Buildroot git (i.e, without SJLJ exceptions), I built
> an ARM system with Lua, and made your test under Qemu. I had the exact
> same output, with the exact same stack trace.
> 
> Are more complicated cases likely to make a difference ?
> 

Unknown.

The prior tests where on MIPS-32, and limited in scope to the simple
tests included in this thread.

Mike
> Regards,
> 
> Thomas
