From: Richard Braun <rbraun@sceen.net>
Date: Fri, 19 Oct 2012 13:26:11 +0200
Subject: [Buildroot] external toolchains and sysroot
In-Reply-To: <50813429.3010107@6wind.com>
References: <508118F0.3030202@6wind.com> <20121019093805.GA2382@mail.sceen.net>
 <50812162.7090809@6wind.com> <20121019095730.GA6397@mail.sceen.net>
 <20121019100213.GA7355@mail.sceen.net> <50813429.3010107@6wind.com>
Message-ID: <20121019112611.GA21369@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 19, 2012 at 01:06:17PM +0200, Jean-Mickael Guerin wrote:
> Not exactly: let the toolchain use its own sysroot, and use -I /-L
> to look up in the staging directory. Original sysroot is read-only &
> shared, staging belongs to your build directory.
> 
> In another words my point is that the copy of sysroot is useless,
> using --sysroot=<my copy of built-in sysroot path, computed from the
> toolchain's compiler> cannot be safer than let it use the built-in
> syroot.
> Removing this copy will save time, space, and compatible whatever
> the directory layout of the toolchain.

Right, this should work just fine. I understand your point now, but then
I can't answer you.

-- 
Richard Braun
