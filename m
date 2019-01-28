From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 10:02:35 +0100
Subject: [Buildroot] [PATCH 1/2] package/atop: bump to version 2.4.0
In-Reply-To: <20190128021406.27477-1-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Mon, 28 Jan 2019 00:14:05 -0200")
References: <20190128021406.27477-1-ricardo.martincoski@gmail.com>
Message-ID: <87h8dtf93o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Drop patch 0001 as it was applied upstream [1].
 > This new version uses PERF_FLAG_FD_CLOEXEC therefore it needs a
 > toolchain with headers >= 3.14.

 > [1] https://github.com/Atoptool/atop/commit/414127c03669b4eedc85778a7bff80cf601311d8

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > ---
 > Applied on master @ df9b13e674, test-pkg:
 > BR2_PACKAGE_ATOP=y
 > 48 builds, 13 skipped, 0 build failed, 0 legal-info failed

Committed, thanks.

-- 
Bye, Peter Korsgaard
