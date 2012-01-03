From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Jan 2012 21:46:05 +0100
Subject: [Buildroot] [PATCH 6/7] openocd: add host variant
In-Reply-To: <CAAXf6LX6R-aW4bPtv6tg933PomgwiBpZvrO2-p+5-jeMVG-Biw@mail.gmail.com>
References: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
 <37af45f118d422d240b625f1169ddb7fb93a60f3.1325178529.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LX6R-aW4bPtv6tg933PomgwiBpZvrO2-p+5-jeMVG-Biw@mail.gmail.com>
Message-ID: <20120103214605.1dc27f74@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 2 Jan 2012 14:13:51 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> >  source "package/uboot-tools/Config.in.host"
> > +source "package/openocd/Config.in.host"
> 
> Shouldn't we be ordering this alphabetically?

Correct, thanks! I fixed it (and for sam-ba as well), and pushed a new
version on my public repository. I'll wait for other comments (if any)
before sending a new v3, unless Peter pulls the branch in the mean time.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
