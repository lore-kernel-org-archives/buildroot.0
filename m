From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Jun 2017 22:10:52 +0200
Subject: [Buildroot] [PATCH] swupdate: fix build with older glibc
In-Reply-To: <32de33e7091437e01987beeacd9f0264f8d78f8d.1496865004.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 7 Jun 2017 22:50:04 +0300")
References: <32de33e7091437e01987beeacd9f0264f8d78f8d.1496865004.git.baruch@tkos.co.il>
Message-ID: <87ink7bltf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add -lrt that is needed for clock_gettime() with glibc before 2.17.
 > Fixes:
 > http://autobuild.buildroot.net/results/034/0345814c0b0023e124992974c0600bdda0824dbf/

 > Cc: J?rg Krause <joerg.krause@embedded.rocks>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
