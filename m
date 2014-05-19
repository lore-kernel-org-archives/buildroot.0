From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 May 2014 21:59:49 +0200
Subject: [Buildroot] [PATCH] samba4: disable libbsd support
In-Reply-To: <1400502477-945-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 19 May 2014 09:27:57 -0300")
References: <1400502477-945-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqdhk096.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > There's a symbol conflict between regular (POSIX) link(2) and the BSD
 > variant for builtin heimdal when libbsd is around and used. Fixes:
 > http://autobuild.buildroot.net/results/657/65726ceccbc2d8fa24e178ea66cd44703768bc95/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
