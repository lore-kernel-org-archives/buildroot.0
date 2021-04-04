From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Apr 2021 11:23:51 +0200
Subject: [Buildroot] [PATCH] package/libcurl: security bump to version
 7.76.0
In-Reply-To: <ab738226f00b0f533fbcd1afa6e1b57a47928956.1617210952.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 31 Mar 2021 20:15:52 +0300")
References: <ab738226f00b0f533fbcd1afa6e1b57a47928956.1617210952.git.baruch@tkos.co.il>
Message-ID: <87eefq2yjc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2021-22890: TLS 1.3 session ticket proxy host mixup (since 7.63.0)
 > CVE-2021-22876: Automatic referer leaks credentials (since 7.1.1)

 > This version adds optional dependency on libgsasl.

 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
