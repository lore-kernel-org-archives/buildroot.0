From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Sep 2011 23:27:20 +0200
Subject: [Buildroot] [PATCH 1/2] ncurses: fix host build breakage
In-Reply-To: <1314972301-5067-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 2 Sep 2011 11:04:48 -0300")
References: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
 <1314972301-5067-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fwjhvfpj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Disable GPM support for host ncurses build since it sometimes
 Gustavo> breaks the build.

Committed, thanks.

-- 
Bye, Peter Korsgaard
