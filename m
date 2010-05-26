From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 May 2010 14:40:29 +0200
Subject: [Buildroot] [PATCH] skeleton: allow logins from ttymxc[0-2]
In-Reply-To: <8abc531ffb433d44641cb8df53abbbe7977b77bd.1274848117.git.baruch@tkos.co.il>
	(Baruch Siach's message of "Wed, 26 May 2010 07:31:36 +0300")
References: <8abc531ffb433d44641cb8df53abbbe7977b77bd.1274848117.git.baruch@tkos.co.il>
Message-ID: <87k4qqomyq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> Add ttymxc[0-2] to the list is the /etc/securetty of the Busybox skeleton.
 Baruch> This is useful for serial logins on i.MX based systems. The same serial
 Baruch> devices already appear in the generic "target_skeleton/".

Committed, thanks.

-- 
Bye, Peter Korsgaard
