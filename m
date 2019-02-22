From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 14:46:06 +0100
Subject: [Buildroot] [PATCH] package/unzip: add security and bug fix
 patches from Debian
In-Reply-To: <0a4e77a81e8dd78540acefbf12952839099383c8.1550813794.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 22 Feb 2019 07:36:34 +0200")
References: <0a4e77a81e8dd78540acefbf12952839099383c8.1550813794.git.baruch@tkos.co.il>
Message-ID: <87ftsgj5r5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Debian bug #741384: Buffer overflow
 > Debian bug #744212: Buffer overflow

 > CVE-2014-8139: CRC32 verification heap-based overflow

 > CVE-2014-8140: Out-of-bounds write issue in test_compr_eb()

 > CVE-2014-8141: Out-of-bounds read issues in getZip64Data()

 > CVE-2014-9636: Heap overflow

 > CVE-2015-7696: Heap overflow when extracting password-protected archive

 > CVE-2015-7697: Infinite loop when extracting password-protected archive

 > Red Hat Bugzilla #1260944: Unsigned overflow on invalid input

 > Debian bug #842993: Do not ignore Unix Timestamps

 > CVE-2014-9913: Buffer overflow

 > CVE-2016-9844: Buffer overflow in zipinfo

 > CVE-2018-1000035: Buffer overflow in password protected ZIP archives

Wow, lots of fixes!

Committed, thanks.

-- 
Bye, Peter Korsgaard
