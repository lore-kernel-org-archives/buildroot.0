From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 11 Aug 2011 17:00:38 +0200
Subject: [Buildroot] $udevroot
In-Reply-To: <1313073148.31365.9.camel@sven>
References: <1313073148.31365.9.camel@sven>
Message-ID: <4E43EE96.1020405@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sven,

> we are facing some problems with device nodes since the udev update. Now
> I am trying to understand how the whole device management works
> nowadays.

What problems are you facing?
 
> First thing that made me wonder is the following output on startup:
> 
> Populating  using udev: done
> 
> This is from /etc/init.d/S10udev and it looks like $udevroot is not set
> here. Is that just a cosmetic issue or an indicator that something is
> severily broken?

Actually we don't need this output any more, because /dev/ is already populated due to devtmpfs.

Yegor
