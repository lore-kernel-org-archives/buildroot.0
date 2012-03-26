From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Mar 2012 21:06:49 +0200
Subject: [Buildroot] Host libxml-parser-perl build issue
In-Reply-To: <CAFbHwiQQwBbj84r0cJAT+eJasO0_UZxn=cGQadNwdr7ph7TFQw@mail.gmail.com>
References: <CAFbHwiSJuD+cJRiiLRWM9siAmuCvSBH+25DTS_0CPgN3WxSbLA@mail.gmail.com>
 <20120326192243.6bb4e9d4@skate>
 <CAFbHwiQQwBbj84r0cJAT+eJasO0_UZxn=cGQadNwdr7ph7TFQw@mail.gmail.com>
Message-ID: <20120326210649.483c81d9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 26 Mar 2012 18:54:11 +0100,
Will Newton <will.newton@gmail.com> a ?crit :

> Yes, that's what it looks like. I can get a full log of build output
> when I am back in the office.

Ok.

> > If so, do you have Perl to the target enabled in your configuration?
> 
> No, the only perl stuff being built is for host tool dependencies.

Ah, ah, strange. So far, our conclusion was that this issue was related
to the selection of Perl for the target. At least that's what we can
conclude from the build tests visible at http://autobuild.buildroot.net.

So definitely, having your .config + build log would be interesting.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
