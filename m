From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 23:13:10 +0200
Subject: [Buildroot] [PATCH] procps-ng: security bump to version 3.3.15
In-Reply-To: <91aa34326a9720369e4291afea525bd4260677c6.1527099544.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 23 May 2018 21:19:04 +0300")
References: <91aa34326a9720369e4291afea525bd4260677c6.1527099544.git.baruch@tkos.co.il>
Message-ID: <874liwbvvd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop upstream patch.
 > This release fixes the issues listed below.

 > CVE-2018-1122: Local privilege escalation in top

 > CVE-2018-1123: Denial of service in ps

 > CVE-2018-1124: Local privilege escalation in libprocps

 > CVE-2018-1125: Stack buffer overflow in pgrep

 > CVE-2018-1126: Integer overflow in proc/alloc

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
