From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Aug 2018 16:20:41 +0200
Subject: [Buildroot] [PATCH] libgit2: security bump to version 0.27.4
In-Reply-To: <04aaf275d91880ff5fa562ddd4177d0cbe386148.1533620000.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 7 Aug 2018 08:33:20 +0300")
References: <04aaf275d91880ff5fa562ddd4177d0cbe386148.1533620000.git.baruch@tkos.co.il>
Message-ID: <87sh3pgcsm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-10887 and CVE-2018-10888: out-of-bounds reads when
 > reading objects from a packfile.

 > Also fixes out-of-bounds reads when processing smart-protocol "ng"
 > packets (no known CVE yet).

 > Drop upstream patch.

 > Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
