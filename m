From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 23:58:38 +0200
Subject: [Buildroot] [lua V3 0/8] lua
In-Reply-To: <20140302000232.6430d956@skate>
References: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
 <20140302000232.6430d956@skate>
Message-ID: <20140419235838.1fb6d8db@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

On Sun, 2 Mar 2014 00:02:32 +0100, Thomas Petazzoni wrote:

> > Francois Perrad (8):
> >   luajit: refactor without dont-strip.patch
> >   luajit: refactor without shared-lib.patch
> >   luajit: handles BR2_PREFER_STATIC_LIB
> >   luajit: add host variant
> >   luainterpreter: add host variant
> >   luarocks: allow to work with host-luainterpreter
> 
> For all these patches, and especially the last three ones, I want
> commit logs. I really do appreciate _a lot_ all the work you're doing
> on Lua and Perl, it's really awesome. And I really mean it. But you
> need to work on improving your commit logs. For now, we have no idea
> *why* you're doing these changes.
> 
> All the other core developers are doing efforts to write long,
> descriptive commit logs, and experience has shown that they are
> immensely useful 6 or 12 months later when we got back in the Git
> history to understand why things were done. Look at what they do, and
> follow the basic rule of thumb that any non-trivial patch should have
> at least 2 or 3 paragraphs in its commit log explaining *why* the
> change is being made.
> 
> At this point, I have no idea what you are doing. I presume patches 4
> and 5 are preparations for patch 6, but I don't understand what patch 6
> is doing, and nowhere it is mentioned why patches 4 and 5 are needed.

Any news about these patches? From this series, we still have patches
4, 5, 6 and 8 pending in patchwork. Could you take into account the
comments that have been made (mainly the strong need for more detailed
commit logs), and resend updated versions on top of master?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
