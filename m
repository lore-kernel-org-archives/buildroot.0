From: Sven Neumann <s.neumann@phase-zero.de>
Date: Mon, 20 Apr 2009 10:18:42 +0200
Subject: [Buildroot] outstanding patches
Message-ID: <1240215522.6315.17.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'd very much appreciate if one of the core developers could have a look
at the patches that I submitted to your bug-tracker:


--------------------------------------------------------------------------
new packages: libsoup, gssdp, gupnp, gupnp-av
https://bugs.busybox.net/show_bug.cgi?id=35

I have attached a new patch here that only adds libsoup. That patch
should be unproblematic (I hope) and it would get us one step closer to
finally getting the gupnp stack into buildroot.
--------------------------------------------------------------------------

--------------------------------------------------------------------------
update gstreamer packages
https://bugs.busybox.net/show_bug.cgi?id=101

There hasn't been any comment on this one. As far as I can see the patch
should be unproblematic. We are using it in our tree for a while now.
--------------------------------------------------------------------------

--------------------------------------------------------------------------
update DirectFB to version 1.2.8
https://bugs.busybox.net/show_bug.cgi?id=281

Just a minor update in the stable DirectFB 1.2 series.
--------------------------------------------------------------------------

--------------------------------------------------------------------------
add taglib
https://bugs.busybox.net/show_bug.cgi?id=283

This simple patch adds a new package to buildroot.
--------------------------------------------------------------------------

--------------------------------------------------------------------------
compilation of samba fails if IPV6 support is missing
https://bugs.busybox.net/show_bug.cgi?id=285

This one is probably a little more controversial. It would be nice to
get some feedback though.
--------------------------------------------------------------------------

Getting these changes integrated upstream would help us a lot and it
would also improve buildroot. Thanks.


Sven
