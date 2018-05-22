From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 May 2018 23:33:54 +0200
Subject: [Buildroot] [PATCH next] opkg: bump to version 0.3.6
In-Reply-To: <f4198d4ca1b1cf8b94466e37b220e0e311912f41.1527015411.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 22 May 2018 21:56:51 +0300")
References: <f4198d4ca1b1cf8b94466e37b220e0e311912f41.1527015411.git.baruch@tkos.co.il>
Message-ID: <87lgcbz871.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Use upstream provided tarball and hash.
 > The tarball conf/ subdirectory contains symlinks to host automake and
 > libtool scripts. We can't rely on these being present or usable. Remove
 > the symlinks, and keep autoreconf to populate the conf/ subdirectory
 > using Buildroot provided autotools.

 > Cc: Derek Baker <Derek-Baker@idexx.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
