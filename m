From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jul 2012 19:06:41 +0200
Subject: [Buildroot] [PATCH] sqlite: do not assume thread support is
 available
In-Reply-To: <1342597816-16767-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1342597816-16767-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20120718190641.3f3fb1ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 18 Jul 2012 09:50:15 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> The --enable-threadsafe option was unconditionally passed, without
> taking into account whether the underlying toolchain had thread
> support or not. Now, we properly pass --enable-threadsafe or
> --disable-threadsafe depending on the availability of thread support.
> 
> Fixes
> http://autobuild.buildroot.net/results/defdc098cff293baabf2f89587476eba71f1c0d0/build-end.log.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
