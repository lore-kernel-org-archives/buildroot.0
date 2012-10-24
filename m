From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Oct 2012 00:55:06 +0200
Subject: [Buildroot] pkgconf patch set can be applied
Message-ID: <20121025005506.177bfb62@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

I did test the pkgconf work from Gustavo on some configurations here. I
found some problems and together with Gustavo we fixed them, which led
Gustavo to send a v7 for the pkgconf package itself.

So now, I think that the following patches can be applied:

 [PATCHv7 1/5] pkgconf: new package
 [PATCHv6 2/5] packages: switch to host-pkgconf
 [PATCHv6 3/5] pkg-config: remove host variant
 [PATCHv6 4/5] pkg-config: mark as deprecated
 [PATCHv6 5/5] iw: pkg-config cleanup

Of course, it is a fairly significant modification, so we will probably
have issues, but only a more large scale testing with the autobuilders
can tell us. So let's apply these and see what happens.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
