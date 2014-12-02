From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Dec 2014 09:43:38 +0100
Subject: [Buildroot] [PATCH] sysklogd: fix redundant newline escape
In-Reply-To: <85c2022d971aa5071bb3749addae8808cce2763f.1417504388.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 2 Dec 2014 09:13:08 +0200")
References: <85c2022d971aa5071bb3749addae8808cce2763f.1417504388.git.baruch@tkos.co.il>
Message-ID: <87k32a30hx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Broken since 428f1e7e70c6b (sysklogd: install configuration file
 > unconditionally). Fixes:

 > package/sysklogd/sysklogd.mk:21: *** missing 'endef', unterminated 'define'.  Stop.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
