From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jul 2012 09:23:53 +0200
Subject: [Buildroot] [PATCH] Allow to run severals post build scripts
 instead of only one
In-Reply-To: <12576_1341818407_4FFA8627_12576_5085_3_1341818407-21478-1-git-send-email-philippe.reynes@sagemcom.com>
References: <12576_1341818407_4FFA8627_12576_5085_3_1341818407-21478-1-git-send-email-philippe.reynes@sagemcom.com>
Message-ID: <20120709092353.4bc9e9c3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 9 Jul 2012 09:20:07 +0200,
Philippe Reynes <philippe.reynes@sagemcom.com> a ?crit :

> Using severals post build scripts is usefull to share
> script between severals boards/projects.
> 
> Signed-off-by: Philippe Reynes <philippe.reynes@sagemcom.com>

I'm fine with this, but I'd like the help text of the
BR2_ROOTFS_POST_BUILD_SCRIPT configuration option to be updated.

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
