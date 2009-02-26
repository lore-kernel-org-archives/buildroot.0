From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Feb 2009 16:21:24 +0100
Subject: [Buildroot] Qtopia4 build issue
In-Reply-To: <20090226122205.390e848a@surf>
References: <20090226122205.390e848a@surf>
Message-ID: <20090226162124.2d78cfa4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Feb 2009 12:22:05 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> With latest SVN, Qtopia4 doesn't build on i386. The problem is that
> 'qmake' is being built with the target compiler instead of the host
> compiler, while qmake is supposed to be executed on the host.

Ok, I think I found a fix for the issue. First of all, the problem only
occurs when cross-compiling on x86 to x86. I will cleanup my fix later
today or tomorrow and submit for discussion.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
