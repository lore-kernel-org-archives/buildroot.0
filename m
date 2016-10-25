From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 21:43:55 +0200
Subject: [Buildroot] [PATCH 4/4] swupdate: added a warning for
 LuaJIT/Lua 5.1
In-Reply-To: <1469809234.3805.10.camel@embedded.rocks>
References: <20160724232739.14132-1-jordan@yelloz.me>
 <20160724232739.14132-5-jordan@yelloz.me>
 <1469809234.3805.10.camel@embedded.rocks>
Message-ID: <20161025214355.21a8d0d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jul 2016 18:20:34 +0200, J?rg Krause wrote:

> > +if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
> > +comment "swupdate cannot use CONFIG_HANDLER_IN_LUA with Lua API <
> > 5.2."
> > +comment "Lua parsers and pre/post-install hooks should still
> > work.????"
> > +endif
> > +  
> 
> I would prefer to put this as a note in the help text.

Agreed. And it's actually in the help text now, thanks to PATCH 3/4 of
this series. See
https://git.buildroot.org/buildroot/commit/?id=02549bd9182f9d333dc47682d51c277786001467.

So I'll mark this PATCH 4/4 as Rejected.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
