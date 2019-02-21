From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:45:44 +0100
Subject: [Buildroot] [PATCH] package/libarchive: add upstream security
 fixes
In-Reply-To: <48b0da1a4cac4ea9e12d0a7c6a42c8bcdb3fdfc6.1549990649.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 12 Feb 2019 18:57:29 +0200")
References: <48b0da1a4cac4ea9e12d0a7c6a42c8bcdb3fdfc6.1549990649.git.baruch@tkos.co.il>
Message-ID: <87tvgxs9lz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2019-1000019: Crash when parsing some 7zip archives.
 > CVE-2019-1000020: A corrupted or malicious ISO9660 image can cause
 > read_CE() to loop forever.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
