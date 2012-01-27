From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2012 11:19:28 +0100
Subject: [Buildroot] gtkmm in buildroot toolchain
In-Reply-To: <loom.20120127T095631-99@post.gmane.org>
References: <loom.20120127T095631-99@post.gmane.org>
Message-ID: <20120127111928.3e881f03@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 27 Jan 2012 08:56:57 +0000 (UTC),
Willy <willy@willygroup.org> a ?crit :

> I've some program written in c++ and gtkmm. 
> 
> Which is the better way to compile them for my embedded system
> between:
> 
>  1. Add (somehow) libgtkmm (and other needed libraries) in buildroot
> toolchain 2. Rewrite entirely my programs with gtk+ (and use always
> it in future) 3. Use another graphic library and rewrite all

All options are possible of course, but option 1) is the one that will
allow you to re-use your software as-is. We already have gtk+ support
in Buildroot, and I don't think that gtkmm has many more dependencies
outside of gtk+, so it should be relatively easy to integrate into
Buildroot.

> PS: I need more documentation for buildroot, exist some good book or
> forum for rookie users?

There is some documentation in the Buildroot sources, run 'make manual'
to generate the documentation.

You can also read the documentation online at
http://buildroot.org/downloads/buildroot.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
