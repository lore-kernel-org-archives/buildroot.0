From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 23:15:44 +0200
Subject: [Buildroot] [PATCH] package/gdb: update host gdb minimum host
 gcc version
In-Reply-To: <20190803205935.12331-1-romain.naour@smile.fr> (Romain Naour's
 message of "Sat, 3 Aug 2019 22:59:35 +0200")
References: <20190803205935.12331-1-romain.naour@smile.fr>
Message-ID: <87mugq6jcv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Following gdb 7.12.1 removal [1] the host gcc version needs
 > to be updated since gdb >= 8.x now requires C++11 compiler.

 > While at it, move BR2_HOST_GCC_AT_LEAST_4_8 under
 > BR2_PACKAGE_HOST_GDB since it's not an architecture
 > dependency. Add a comment when the host gcc is too
 > old to build host gdb.

 > [1] d36f2c73331b3ab4e238eeb47d7d79d81a895a59

 > Fixes:
 > http://autobuild.buildroot.org/results/822/822a747a6717db57705d1ce198a61988aa1173b1

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>


Committed, thanks.

-- 
Bye, Peter Korsgaard
