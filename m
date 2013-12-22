From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Dec 2013 12:09:39 +0100
Subject: [Buildroot] [PATCH] squid: drop session external acl helper,
	use file_userip
In-Reply-To: <1387710145-27841-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 22 Dec 2013 08:02:25 -0300")
References: <1387710145-27841-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lhzdf8gc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The session external acl helper needs berkeleydb, switch to the basic
 > file_userip one which was my original intention (renamed from ip_user in
 > the 3.3.x series). Fixes:
 > http://autobuild.buildroot.net/results/635/6359137cde3b293d46df732836b8966d30f23cbc/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
