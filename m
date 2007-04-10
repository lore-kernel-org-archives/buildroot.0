From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Tue, 10 Apr 2007 14:23:57 +0300
Subject: [Buildroot] [patch] sysroot support in toolchain,
 use correct pathes in staging_dir
In-Reply-To: <20070410103901.GC15274@aon.at>
References: <20070410103901.GC15274@aon.at>
Message-ID: <461B73CD.7040009@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer kirjoitti:
> Hi,
> 
> This is a heads-up that i mean to correct the pathes to includes and
> libs in the staging dir as suggested in bug 
> http://busybox.net/bugs/view.php?id=1290
> Doing so is ment to ease moving the staging-dir (and it's
> cross-compiler) to a different machine for re-use.

What was the original purpose of putting all headers under /include anyway?

-- Heikki Lindholm
