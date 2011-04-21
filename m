From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Apr 2011 23:21:40 +0200
Subject: [Buildroot] [PATCH 5/7] readline: bump to version 6.2pl1
In-Reply-To: <1303321319-16553-5-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Wed, 20 Apr 2011 14:41:57 -0300")
References: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
	<1303321319-16553-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y633xpuj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/readline/readline-6.1-curses-link.patch |   16 ------------
 Gustavo>  package/readline/readline-6.2-pl1.patch         |   29 +++++++++++++++++++++++
 Gustavo>  package/readline/readline-curses-link.patch     |   16 ++++++++++++

Doesn't the patch logic ignore readline-curses-link.patch when it sees
readline-6.2-*.patch?

-- 
Bye, Peter Korsgaard
