From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jun 2014 14:40:22 +0200
Subject: [Buildroot] [ANNOUNCE] Autobuilder script available,
 join the autobuilder effort!
In-Reply-To: <CAAXf6LXqEH7qu_u_XkWcGODETc5wv8WsRxUyAAASoH8kTmObkQ@mail.gmail.com>
References: <20140614212341.5306ead8@free-electrons.com>
 <CAAXf6LWy4ysqMhrQ=FMZszUoyYzd_711VfCCgSUTO_WwTQ8vbA@mail.gmail.com>
 <20140617130025.664a1df6@free-electrons.com>
 <CAAXf6LVfQJvMQjHdvD+M_3HVLtD=h_bVoq=x8UP1WrPDYGc_Uw@mail.gmail.com>
 <20140618102531.34c6f3ea@free-electrons.com>
 <CAAXf6LXqEH7qu_u_XkWcGODETc5wv8WsRxUyAAASoH8kTmObkQ@mail.gmail.com>
Message-ID: <20140619144022.54520011@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 18 Jun 2014 13:51:27 +0200, Thomas De Schampheleire wrote:

> In the mean time another such issue popped up, here is the output:
> 
> make: Entering directory `/repo/tdescham/autobuild/workdir/instance-0/buildroot'
> package/luajit/luajit.mk:67: *** Configuration error: both "luajit"
> and "lua" are selected as providers for virtual package
> "luainterpreter". Only one provider can be selected at a time. Please
> fix your configuration.  Stop.
> make: Leaving directory `/repo/tdescham/autobuild/workdir/instance-0/buildroot'
> [Wed, 18 Jun 2014 13:42:43] ERROR: cannot savedefconfig

Weird, why is this error happening at "savedefconfig" time ?

> We already talked about such problems before, did you already have a
> solution implemented in the original autobuild instance?

No, I did not implement anything like that in the original autobuild
instance, so I'm wondering why I don't see the problem. Maybe it gets
ignored by improper error checking or something.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
