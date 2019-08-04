From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 14:13:14 +0200
Subject: [Buildroot] [PATCH 6/6] package/gcc: remove version 6.5
In-Reply-To: <20190802130937.12591-6-romain.naour@smile.fr> (Romain Naour's
 message of "Fri, 2 Aug 2019 15:09:36 +0200")
References: <20190802130937.12591-1-romain.naour@smile.fr>
 <20190802130937.12591-6-romain.naour@smile.fr>
Message-ID: <87pnll163p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > gcc 9.1 is around, gcc 8.3 is the default version, so drop
 > 6.5 in order to reduce the gcc choice.

 > Keep gcc 5.5 since it still used by beaglebone_qt5_defconfig.

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
