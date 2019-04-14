From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:27:18 +0200
Subject: [Buildroot] [PATCH] package/ghostscript: security bump to
 version 9.27
In-Reply-To: <24adb9f85a61b197173ede2368293e269898a152.1554870499.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 10 Apr 2019 07:28:19 +0300")
References: <24adb9f85a61b197173ede2368293e269898a152.1554870499.git.baruch@tkos.co.il>
Message-ID: <87ef64ffbd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2019-3835, CVE-2019-3838: A specially crafted PostScript file
 > could use these flaws to have access to the file system outside of the
 > constrains imposed by -dSAFER.

 > Drop upstream patches.

 > Use the make subst function to compute the download site from version.

 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
