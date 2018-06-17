From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:58:39 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: depend on
 host-nfs-utils
In-Reply-To: <20180530212702.14411-1-romain.naour@gmail.com> (Romain Naour's
 message of "Wed, 30 May 2018 23:27:02 +0200")
References: <20180530212702.14411-1-romain.naour@gmail.com>
Message-ID: <8736xltq74.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > host-nfs-utils provides the host rpcgen utility. This fixes the build on
 > recent Fedora systems that removed rpcgen from the glibc package.

 > Fixes:
 > http://autobuild.buildroot.net/results/e21/e219b8bacb52bb661eb6663b82f549ed941f26fe

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
