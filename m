From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 09:13:33 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.58.0
In-Reply-To: <2b63b04eb854b6cbe827f27b75d9fd5f843e4dc9.1516947476.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 26 Jan 2018 08:17:56 +0200")
References: <2b63b04eb854b6cbe827f27b75d9fd5f843e4dc9.1516947476.git.baruch@tkos.co.il>
Message-ID: <87r2qdjavm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-1000007: libcurl might leak authentication data to third
 > parties.

 > https://curl.haxx.se/docs/adv_2018-b3bf.html

 > Update license hash due to copyright year change.

It also fixes CVE-2018-1000005, so I updated the commit log to mention
that and committed, thanks.

-- 
Bye, Peter Korsgaard
