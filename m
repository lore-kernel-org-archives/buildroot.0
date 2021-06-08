From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Jun 2021 09:09:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/hwloc: add optional
 dependencies to udev, libxml2, ncurses & numactl
In-Reply-To: <20210523094346.118963-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 23 May 2021 11:43:46 +0200")
References: <20210523094346.118963-1-bernd.kuhls@t-online.de>
Message-ID: <87czswsugs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > udev:
 > https://github.com/open-mpi/hwloc/blob/master/config/hwloc.m4#L626

 > libxml2:
 > https://github.com/open-mpi/hwloc/blob/master/config/hwloc.m4#L1273

 > ncurses:
 > https://github.com/open-mpi/hwloc/blob/master/config/hwloc_internal.m4#L340

 > numactl:
 > https://github.com/open-mpi/hwloc/blob/master/config/hwloc_internal.m4#L419

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
