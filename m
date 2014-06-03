From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Jun 2014 09:19:32 +0200
Subject: [Buildroot] [PATCH] uclibc: fix build without LARGEFILE for
	xtensa
In-Reply-To: <0952b6a3333682b60256575e7f12e47c9d8cab13.1401778970.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 3 Jun 2014 10:02:50 +0300")
References: <0952b6a3333682b60256575e7f12e47c9d8cab13.1401778970.git.baruch@tkos.co.il>
Message-ID: <87r436sbnf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The default uClibc version for xtensa is broken when LARGEFILE is disabled.
 > Add a patch to fix this.

 > Reported-by: Waldemar Brodkorb <wbx@openadk.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
