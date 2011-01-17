From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Jan 2011 21:08:26 +0100
Subject: [Buildroot] [PATCH] bash: build after busybox
In-Reply-To: <1294767647-8269-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 11 Jan 2011 14:40:47 -0300")
References: <1294767647-8269-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bp3fmgxx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Make sure bash builds after busybox when it's enabled to override
 Gustavo> busybox's /bin/sh symlink with bash.

Committed, thanks.

-- 
Bye, Peter Korsgaard
