From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Apr 2021 18:40:05 +0200
Subject: [Buildroot] [PATCH] package/clamav: security bump to version
 0.103.2
In-Reply-To: <20210409204106.12638-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 9 Apr 2021 22:41:06 +0200")
References: <20210409204106.12638-1-peter@korsgaard.com>
Message-ID: <87lf9q3xga.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-1386: Fix for UnRAR DLL load privilege escalation.  Affects
 >   0.103.1 and prior on Windows only.

 > - CVE-2021-1252: Fix for Excel XLM parser infinite loop.  Affects 0.103.0
 >   and 0.103.1 only.

 > - CVE-2021-1404: Fix for PDF parser buffer over-read; possible crash.
 >   Affects 0.103.0 and 0.103.1 only.

 > - CVE-2021-1405: Fix for mail parser NULL-dereference crash.  Affects
 >   0.103.1 and prior.

 > - CVE-2021-27506: The ClamAV Engine (Version 0.103.1 and below) embedded in
 >   Storsmshield Network Security (1.0 to 4.1.5) is subject to DoS in case of
 >   parsing of malformed png files.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
