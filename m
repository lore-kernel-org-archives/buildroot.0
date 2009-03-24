From: Sven Neumann <s.neumann@phase-zero.de>
Date: Tue, 24 Mar 2009 13:17:37 +0100
Subject: [Buildroot] svn commit: [25801] trunk/buildroot/package:
 autoconf automake
In-Reply-To: <20090323214643.A579A76A00@busybox.osuosl.org>
References: <20090323214643.A579A76A00@busybox.osuosl.org>
Message-ID: <1237897057.1439.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

today I updated to the 20090324 snapshot and my build breaks here:


mkdir -p /home/sven/buildroot/build_arm/automake-1.10-host
bzcat /home/sven/buildroot/dl/automake-1.10.tar.bz2 | \
		tar --strip-components=1
-C /home/sven/buildroot/build_arm/automake-1.10-host   -xf -
toolchain/patch-kernel.sh /home/sven/buildroot/build_arm/automake-1.10-host package/automake/ \*.patch
touch /home/sven/buildroot/build_arm/stamps/host_automake_unpacked
make: *** No rule to make target
`/home/sven/buildroot/dl/autoconf-2.63.tar.bz2', needed by
`/home/sven/buildroot/build_arm/stamps/host_autoconf_unpacked'.  Stop.


Sven
