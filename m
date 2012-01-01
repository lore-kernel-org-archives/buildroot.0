From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jan 2012 14:35:38 +0100
Subject: [Buildroot] [PATCH 1/1] valgrind: bump to 3.7.0 and fix build
 with ccache
In-Reply-To: <6d753f5cb4dcbda5715d538bf956f72ec82bbcf5.1325340331.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325340331.git.thomas.petazzoni@free-electrons.com>
 <6d753f5cb4dcbda5715d538bf956f72ec82bbcf5.1325340331.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20120101143538.1b16b552@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 31 Dec 2011 15:07:08 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> After bumping to 3.7.0, the valgrind-3.6.1-configure-support-linux-3.patch is
> no longer necessary since it was added upstream. The
> valgrind-3.7.0-compiler-check.patch patch is added to fix a compiler version
> check issue (patch taken from the upstream Subversion repository). The
> valgrind-3.7.0-fix-ccache-support.patch is added to fix the build process when
> ccache is used.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This patch has received a:

Tested-by: Marek Belisko <marek.belisko@open-nandra.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
