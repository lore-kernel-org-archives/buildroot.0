From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 13 Jan 2007 11:16:34 +0100
Subject: [Buildroot] error:make too old
In-Reply-To: <KLECJOHKIJNMEKLBDEGEOEHMCDAA.sunil.ayyapureddy@semindia.in>
References: <KLECJOHKIJNMEKLBDEGEOEHMCDAA.sunil.ayyapureddy@semindia.in>
Message-ID: <20070113101634.GB14212@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 12, 2007 at 04:13:51PM +0530, Sunil A wrote:
>Iam trying to build a toolchain for powerpc using the
>builldroot-20070108.tar.bz2 package ,but am encountering the following error
>while building,
>make[1]: Entering directory
>`/DATA1/sunil/buildroot/toolchain_build_powerpc/uClibc'
>Rules.mak:10: *** Your make is too old 3.79.1. Go get at least 3.80.  Stop.
>make[1]: Leaving directory
>`/DATA1/sunil/buildroot/toolchain_build_powerpc/uClibc'
>make: ***
>[/DATA1/sunil/buildroot/toolchain_build_powerpc/uClibc/.configured] Error 2
>
>Please let me know the solution.

Well, if you make --version is less than 3.80, then you have to update
your hosts make.
