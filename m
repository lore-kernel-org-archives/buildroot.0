From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:58:23 +0100
Subject: [Buildroot] [PATCH] package/intel-microcode: security bump to
 version 20201118
In-Reply-To: <20210209163641.26115-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 9 Feb 2021 17:36:40 +0100")
References: <20210209163641.26115-1-peter@korsgaard.com>
Message-ID: <87ft23k84g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-8694: Insufficient access control in the Linux kernel driver for
 >   some Intel(R) Processors may allow an authenticated user to potentially
 >   enable information disclosure via local access.

 >   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00389.html

 > - CVE-2020-8695: Observable discrepancy in the RAPL interface for some
 >   Intel(R) Processors may allow a privileged user to potentially enable
 >   information disclosure via local access.

 >   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00389.html

 > - CVE-2020-8698: Improper removal of sensitive information before storage or
 >   transfer in some Intel(R) Processors may allow an authenticated user to
 >   potentially enable information disclosure via local access.

 >   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00381.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
