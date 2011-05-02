From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 May 2011 21:41:24 +0200
Subject: [Buildroot] [PATCH 3/3] libxslt: fixup configure options
In-Reply-To: <1304363303-14984-3-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Mon, 2 May 2011 16:08:23 -0300")
References: <1304363303-14984-1-git-send-email-gustavo@zacarias.com.ar>
	<1304363303-14984-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pqo0sxej.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Some configure options changed so adjust.
 Gustavo> Forcibly disabling threads isn't good and also it's detected by
 Gustavo> configure when there are no threads.

Committed, thanks.

-- 
Bye, Peter Korsgaard
