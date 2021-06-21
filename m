From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Jun 2021 21:35:22 +0200
Subject: [Buildroot] [PATCH] package/intel-microcode: security bump to
 version 20210608
In-Reply-To: <20210613211011.23696-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 13 Jun 2021 23:10:11 +0200")
References: <20210613211011.23696-1-peter@korsgaard.com>
Message-ID: <87zgvj80zp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-24489: A potential security vulnerability in some Intel?
 >   Virtualization Technology for Directed I/0 (VT-d) products may allow
 >   escalation of privilege.  Intel is releasing firmware updates to mitigate
 >   this potential vulnerability.
 >   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00442.html

 > - CVE-2020-24511: Potential security vulnerabilities in some Intel?
 >   Processors may allow information disclosure.  Intel is releasing firmware
 >   updates to mitigate these potential vulnerabilities.
 >   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00464.html

 > - CVE-2020-24513: A potential security vulnerability in some Intel Atom?
 >   Processors may allow information disclosure.  Intel is releasing firmware
 >   updates to mitigate this potential vulnerability.
 >   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00465.html

 > For more details, see the release notes:
 > https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20210608

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
