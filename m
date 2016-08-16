From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 16 Aug 2016 22:43:26 +0000
Subject: [Buildroot] BuildRoot cannot build powerpc64
Message-ID: <F9C551623D2CBB4C9488801D14F864C6EE8B1000@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I just downloaded 2016_08rc-1 and attempted to build an RFS for the
T-series PowerPC parts, which, I assume, are powerpc64 and e5500.  In
doing so, after I select powerpc64 I cannot select any library for the
toolchain as all of the config dependencies appear to be excluding
powerpc64 in the options.

Is this by design or oversight?

Thanks,
Andy
