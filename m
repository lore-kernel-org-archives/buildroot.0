From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Sep 2017 23:58:06 +0200
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.55.0
In-Reply-To: <4f33b3435349660c4e3f2b444104442e6a9498b1.1502386545.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 10 Aug 2017 20:35:45 +0300")
References: <4f33b3435349660c4e3f2b444104442e6a9498b1.1502386545.git.baruch@tkos.co.il>
Message-ID: <87h8wgkdu9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes:
 >  glob: do not parse after a strtoul() overflow range (CVE-2017-1000101)
 >  tftp: reject file name lengths that don't fit (CVE-2017-1000100)
 >  file: output the correct buffer to the user (CVE-2017-1000099)

 > Switch to .tar.xz to save bandwidth.

 > Add reference to tarball signature.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
