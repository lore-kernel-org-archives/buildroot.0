From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Mar 2012 19:22:43 +0200
Subject: [Buildroot] Host libxml-parser-perl build issue
In-Reply-To: <CAFbHwiSJuD+cJRiiLRWM9siAmuCvSBH+25DTS_0CPgN3WxSbLA@mail.gmail.com>
References: <CAFbHwiSJuD+cJRiiLRWM9siAmuCvSBH+25DTS_0CPgN3WxSbLA@mail.gmail.com>
Message-ID: <20120326192243.6bb4e9d4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 26 Mar 2012 17:35:29 +0100,
Will Newton <will.newton@gmail.com> a ?crit :

> I have a build failure building avahi on a CentOS 5 system (old, but
> not ancient) which is caused by the configure script failing to load
> the XML::Parser perl module.

I guess it looks like:
http://autobuild.buildroot.org/results/4a9ad56f4690d6958164fac72bce8b97db6d2356/build-end.log

Correct?

If so, do you have Perl to the target enabled in your configuration?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
