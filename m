From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 18:28:07 +0200
Subject: [Buildroot] [PATCH 1/3] gpsd: proper usage of prefix and DESTDIR
In-Reply-To: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20120725182807.16c6af26@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 00:10:29 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> prefix should always be /usr, and destdir must be passed as DESTDIR,
> and in the environment, not as a scons argument. Finally, we pass the
> sysroot= argument to scons so that it doesn't add -L/usr/lib
> parameters when compiling.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied all 3 patches, with the TARGET_DIR -> STAGING_DIR fix
mentioned by Simon.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
