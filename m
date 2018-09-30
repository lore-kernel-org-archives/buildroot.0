From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 10:44:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/efl: bump to version 1.21.1
In-Reply-To: <20180929132817.30011-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 29 Sep 2018 15:28:16 +0200")
References: <20180929132817.30011-1-romain.naour@gmail.com>
Message-ID: <8736tr4bnt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Remove the --enable-i-really-know-what-i-am-doing[...] option removed by
 > upstream [1]. But keep BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG at Kconfig
 > level for Buildroot users since "warnings for disabling features have
 > been left intact".

 > Update license file hash since dates was removed from the license text.

 > [1] https://git.enlightenment.org/core/efl.git/commit/?id=1cda9fe749636484b1328e694a8dbbe4f9d0c31d

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
