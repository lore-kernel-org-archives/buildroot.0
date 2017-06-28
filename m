From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jun 2017 23:23:58 +0200
Subject: [Buildroot] [PATCH] systemd: add security fix
In-Reply-To: <fece5e5b122b3b81b63d6394163c462d4790b8b7.1498675471.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 28 Jun 2017 21:44:31 +0300")
References: <fece5e5b122b3b81b63d6394163c462d4790b8b7.1498675471.git.baruch@tkos.co.il>
Message-ID: <87podnergx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a fix for CVE-2017-9445: a specially crafted TCP payload might cause
 > memory corruption.

Great, it was still on my TODO list. I've extended the commit message
with the CVE description from MITRE to make it clear that this is an
issue in systemd-resolved and committed, thanks.

-- 
Bye, Peter Korsgaard
