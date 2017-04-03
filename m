From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Apr 2017 10:31:28 +0200
Subject: [Buildroot] [PATCH] pcre: add upstream security fixes
In-Reply-To: <fccce84215ce3160b0ab6d38e5f58a4188af174e.1490958576.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 31 Mar 2017 14:09:36 +0300")
References: <fccce84215ce3160b0ab6d38e5f58a4188af174e.1490958576.git.baruch@tkos.co.il>
Message-ID: <87inmlvqn3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Take Debian adapted patches of upstream.
 > Fixes:

 > CVE-2017-6004: crafted regular expression may cause denial of service

 > CVE-2017-7186: invalid Unicode property lookup may cause denial of service

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
