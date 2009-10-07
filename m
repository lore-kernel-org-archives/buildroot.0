From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 12:59:51 +0200
Subject: [Buildroot] [PATCH 08/23] qt: remove no longer needed
 'x86x86fix' workaround
In-Reply-To: <200910071226.37310.mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-9-git-send-email-mroth@nessie.de>
	<20091007115514.4d9f36c7@surf> <200910071226.37310.mroth@nessie.de>
Message-ID: <20091007125951.764be92b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 7 Oct 2009 12:26:31 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> I built on a x86 box a full cross-toolchain f?r x86/uClibc. I even
> compiled the analogclock example from Qt and run it and it worked
> flawless.
> 
> From the Qt-configure output on this test:
> 
> 	[...]
> 	Building on:   linux-g++
> 	Building for:  qws/linux-x86-g++
> 	Architecture:  i386
> 	Host architecture: i386
> 	[...]
> 
> So it looks like that Qt-configure is getting this fully right. I
> also read the configure-script from Qt and found no reason for this
> x86x86fix. But I didn't checked older Qt version.

Perfect.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
