From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Jan 2014 09:14:41 +0100
Subject: [Buildroot] [PATCH] busybox: udhcpc script: suppress useless
	error message
In-Reply-To: <d91ce81270c14b0f3d76ecb8f3ce31528d5efdf2.1389859113.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 16 Jan 2014 09:58:33 +0200")
References: <d91ce81270c14b0f3d76ecb8f3ce31528d5efdf2.1389859113.git.baruch@tkos.co.il>
Message-ID: <8761pks5qm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Suppress the following error:
 > route: SIOCDELRT: No such process

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
