From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 09:24:03 +0100
Subject: [Buildroot] [PATCH] dt: new package
In-Reply-To: <56A7FF99.4030202@free-electrons.com>
References: <1453840823-24345-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <20160126215833.1afdb8dc@free-electrons.com>
 <56A7FF99.4030202@free-electrons.com>
Message-ID: <20160127092403.56330c11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jan 2016 20:22:01 -0300, Gustavo Zacarias wrote:

> > I think this one should rather be:
> >
> > ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
> > ...
> > endif
> 
> Hi.
> Musl has support for posix aio, so in the oft chance that someone wants 
> to patch/enable, in this way it would be inaccurate.

OK, makes sense.

> > What do you think ?
> 
> Sure, i can spin v2 with this change.

Great, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
