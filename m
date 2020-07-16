From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:49:54 +0200
Subject: [Buildroot] [PATCH] package/libcurl: security bump to version
 7.71.0
In-Reply-To: <59cdc3789225ac3861f527311661488be9e532d8.1593022160.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 24 Jun 2020 21:09:20 +0300")
References: <59cdc3789225ac3861f527311661488be9e532d8.1593022160.git.baruch@tkos.co.il>
Message-ID: <874kq7v4rh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2020-8177: curl overwrite local file with -J.
 > CVE-2020-8169: Partial password leak over DNS on HTTP redirect.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
