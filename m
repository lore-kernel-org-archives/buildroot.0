From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 May 2010 23:29:10 +0200
Subject: [Buildroot] [PATCH] customize: fix copy paths
In-Reply-To: <1273097819-8002-1-git-send-email-luca@lucaceresoli.net>
	(luca@lucaceresoli.net's message of "Thu, 6 May 2010 00:16:59 +0200")
References: <1273097819-8002-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87hbmk90t5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "luca" == luca  <luca@lucaceresoli.net> writes:

 luca> From: Luca Ceresoli <luca@lucaceresoli.net>
 luca> customize.mk used to copy files with a wrong command, resulting in one
 luca> directory level in excess. For example, source/etc/myfile would have
 luca> produced /etc/etc/myfile in the target filesystem instead of /etc/myfile.

Committed, thanks.

-- 
Bye, Peter Korsgaard
