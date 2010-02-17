From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Feb 2010 11:19:01 +0100
Subject: [Buildroot] [PATCH] get_linux_config.sh: sets THIS_MINOR to 0
	if not valid.
In-Reply-To: <1265731864-30953-1-git-send-email-julien.boibessot@free.fr>
	(julien boibessot's message of "Tue, 9 Feb 2010 17:11:04 +0100")
References: <1265731864-30953-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <877hqc412i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

 julien> From: Julien Boibessot <julien.boibessot@armadeus.com>
 julien> Sets THIS_MINOR to 0 if not valid, ie when processing a Linux config file who do not
 julien> have a minor number extension; ex: "<name>-linux-2.6.<major>.config"
 julien> Otherwise bash is raising an error/exception (line 59) and script can not complete.


Committed, thanks.

-- 
Bye, Peter Korsgaard
