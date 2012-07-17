From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 10:40:00 +0200
Subject: [Buildroot] [PATCH 1/5] lua : fix autobuild.buildroot
In-Reply-To: <CAB0FRsszFbq5_yMhpxeW4NzQHJ1oG24S1+SGoj8qgR0-3A3rBw@mail.gmail.com>
References: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
 <20120716173958.39ab39b3@skate>
 <CAB0FRsszFbq5_yMhpxeW4NzQHJ1oG24S1+SGoj8qgR0-3A3rBw@mail.gmail.com>
Message-ID: <20120717104000.695658f8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 17 Jul 2012 10:35:15 +0200,
Fran?ois Perrad <francois.perrad@gadz.org> a ?crit :

> I want remove BR2_PACKAGE_LUA_SHARED_LIBRARY only in Lua modules,
> because it is an internal of the lua package, and Lua modules must be
> used with Lua or LuaJIT.
> 
> see http://patchwork.ozlabs.org/patch/162294/

Yes, you said that to me during the Libre Software Meeting, but this
modification isn't part of the 5 patches patch set you have sent
yesterday, so I was a bit confused.

Can we have a complete patch set, with *all* your proposed changes to
the Lua packaging?

It's really complex to review patches for which you say that anyway
such or such option is removed by a later patch, which is not in the
same patch series.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
