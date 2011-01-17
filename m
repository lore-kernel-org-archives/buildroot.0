From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Jan 2011 20:48:21 +0100
Subject: [Buildroot] [PATCH 10/13] sshfs: select openssh instead of
	depending
In-Reply-To: <1294431182-27793-10-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Fri, 7 Jan 2011 17:12:59 -0300")
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
	<1294431182-27793-10-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wrm3mhve.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Select openssh in Config.in rather than depend on it.
 Gustavo> Otherwise the option is missing without an obvious reason.

Committed, thanks.

-- 
Bye, Peter Korsgaard
