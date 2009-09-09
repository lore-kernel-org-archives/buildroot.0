From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 9 Sep 2009 20:29:17 +0200
Subject: [Buildroot] GRUB for i386
In-Reply-To: <BAY136-W2B7F87FA68D145120E121CEE90@phx.gbl>
References: <BAY136-W2B7F87FA68D145120E121CEE90@phx.gbl>
Message-ID: <20090909182917.GC17081@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 09, 2009 at 01:16:23PM +0100, Raed Abu-Sanad wrote:
>
>Hi,,
>
>I managed to get a rootfs with all required packages for i386. I put the rootfs in a USB flash stick.
>How can i install GRUB to boot from it?? (the GRUB was one if the selected packages when building buildroot)

I once ?) had a hack for grub so you could install it into a loop
device, not sure if that's needed any longer (and i suggest you try if
upgrading to grub2 saves size).

?) http://repo.or.cz/w/buildroot.git?a=tree;f=target/x86/grub;hb=master

HTH,
