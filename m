From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2011 17:32:50 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <20111023123755.GA2455@tarshish>
References: <20111017184718.71afc290@skate> <20111021154303.43f98ccd@skate>
 <20111023123755.GA2455@tarshish>
Message-ID: <20111024173250.7e598d6f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 23 Oct 2011 14:37:55 +0200,
Baruch Siach <baruch@tkos.co.il> a ?crit :

> 1. Slide 23: missing -e in the 'echo' command
> 
> $ echo "/dev/mtdblock7\t\t/applog\tjffs2\tdefaults\t\t0\t0"
> /dev/mtdblock7\t\t/applog\tjffs2\tdefaults\t\t0\t0
> 
> $ echo -e "/dev/mtdblock7\t\t/applog\tjffs2\tdefaults\t\t0\t0"
> /dev/mtdblock7      /applog jffs2   defaults        0   0

-e is not needed with sh:

$ echo "bla\nbli"
bla
bli
$ echo -e "bla\nbli"
-e bla
bli

> 2. Slides 24-27: header should be "Project-specific packages (x/5)", instead 
>    of "... (x/4)".  (Can't TeX do this automatically somehow?)

Fixed. I don't know if TeX can do this automatically. Maybe.

Thanks for the comments. I also fixed the various comments raised by
Thomas. Thanks again!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
