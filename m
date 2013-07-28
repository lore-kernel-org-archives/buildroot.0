From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 16:05:53 +0200
Subject: [Buildroot] [PATCH] libiqrf: Bump to v0.1.2 + update build
 system.
In-Reply-To: <1372884680-14309-1-git-send-email-marek.belisko@open-nandra.com>
References: <1372884680-14309-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20130728160553.64482586@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marek Belisko,

On Wed,  3 Jul 2013 22:51:20 +0200, Marek Belisko wrote:
> v0.1.2 update build system from autotools to cmake.

Committed, thanks. I had to add a simple patch to the CMakeLists.txt to
avoid CMake needlessly checking for a C++ compiler. It would be good if
this patch could be upstreamed.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
