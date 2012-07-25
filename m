From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 18:28:31 +0200
Subject: [Buildroot] [PATCH] dbus: requires thread support
In-Reply-To: <1343208670-19908-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1343208670-19908-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20120725182831.59966fff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 11:31:10 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> As can be seen on the build result at
> http://autobuild.buildroot.org/results/20f1078ef7dc5f187b04c63ef70e8b43acf9bb3a/build-end.log,
> D-Bus requires thread support in the toolchain.
> 
> This commit adjusts the Kconfig dependencies of D-Bus and all its
> reverse dependencies to depend on thread support in the toolchain.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
