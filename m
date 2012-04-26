From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Apr 2012 14:25:09 +0200
Subject: [Buildroot] error toolchain build for mips-linux-uclibc with
 BR2_INSTALL_LIBSTDCPP
In-Reply-To: <4F993D25.8070906@rfnetech.com>
References: <CAAawjsQQ0nc9HYYAegCTs6sRM+rwXhimyV83hB+jwR6bo1B=SA@mail.gmail.com>
 <4F991F94.50608@rfnetech.com> <20120426140413.3f394243@skate>
 <4F993D25.8070906@rfnetech.com>
Message-ID: <20120426142509.1fe544d5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Apr 2012 20:18:45 +0800,
oreddy <oreddy@rfnetech.com> a ?crit :

> Yeah absolutely correct, but I think it needs more time to test the 
> whole build and applications running on it again.

Sure.

> Anyhow when I was goggling, found a patch 
> http://git.buildroot.net/buildroot/commit/?id=6b578c8d73b6403e3be8bddf611fb1059d7c2f4b 
> which is more related to this issue. Will try this and come back.

It's unlikely. It just shuffles options around, but does not do any
real change to the build logic.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
