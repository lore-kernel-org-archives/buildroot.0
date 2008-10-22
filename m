From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2008 17:01:46 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20081022124754.407DF3C375@busybox.net>
References: <20081022124754.407DF3C375@busybox.net>
Message-ID: <20081022170146.28aaf1ea@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Oct 2008 05:47:54 -0700 (PDT),
laird at uclibc.org a ?crit :

> Author: laird
> Date: 2008-10-22 05:47:53 -0700 (Wed, 22 Oct 2008)
> New Revision: 23763

This breaks the compilation of libpng for me. The configure script
thinks that my arm-linux-gcc is not able to generate shared libraries.
Removing the two added lines fix the problem.

I didn't had this issue with my original patch, but I didn't
investigate in what way your patch differs from mine.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
