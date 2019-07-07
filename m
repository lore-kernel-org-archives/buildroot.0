From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jul 2019 08:43:45 +0200
Subject: [Buildroot] [PATCH] package/faad2: add upstream security fixes
In-Reply-To: <202f3ce613cead8063357b6d9aae1da5f9bdcf09.1561985006.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 1 Jul 2019 15:43:26 +0300")
References: <202f3ce613cead8063357b6d9aae1da5f9bdcf09.1561985006.git.baruch@tkos.co.il>
Message-ID: <87o926bazi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2018-20194: Stack buffer overflow on invalid input
 > CVE-2018-20362: Null pointer dereference when processing crafted AAC
 > input

 > Add two more crash fixes from upstream.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
