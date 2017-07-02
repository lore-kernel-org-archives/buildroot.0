From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jul 2017 15:34:41 +0200
Subject: [Buildroot] [PATCH] systemd: add security fix
In-Reply-To: <fece5e5b122b3b81b63d6394163c462d4790b8b7.1498675471.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 28 Jun 2017 21:44:31 +0300")
References: <fece5e5b122b3b81b63d6394163c462d4790b8b7.1498675471.git.baruch@tkos.co.il>
Message-ID: <87zicnarny.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a fix for CVE-2017-9445: a specially crafted TCP payload might cause
 > memory corruption.

 > The other patch fixes an issue with the security fix.

 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
