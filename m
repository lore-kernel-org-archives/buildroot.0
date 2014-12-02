From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Dec 2014 09:42:24 +0100
Subject: [Buildroot] [PATCH] proftpd: remove redundant newline escape
In-Reply-To: <6760a4decd5ac702345eb2dde6d3ac410ef72993.1417504238.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 2 Dec 2014 09:10:38 +0200")
References: <6760a4decd5ac702345eb2dde6d3ac410ef72993.1417504238.git.baruch@tkos.co.il>
Message-ID: <87oarm30jz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Broken since 0e18b0a4e12e7 (proftpd: install configuration file
 > unconditionally). Fixes the following make error:

 > package/proftpd/proftpd.mk:49: *** missing 'endef', unterminated 'define'.  Stop.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
