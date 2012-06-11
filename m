From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jun 2012 21:32:48 +0200
Subject: [Buildroot] [PATCH] pppd: fix plugin search path
In-Reply-To: <1339435239-9581-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 11 Jun 2012 14:20:39 -0300")
References: <1339435239-9581-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lijtfxun.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fix the plugin search path by passing a --prefix to configure.
 Gustavo> DESTDIR is used in the source code for the search path of plugins
 Gustavo> (DESTDIR/lib/pppd/VERSION).
 Gustavo> Since DESTDIR defaults to /usr/local we get the search path wrong so the
 Gustavo> 'plugin' directive requires a full pathspec to the plugin rather than
 Gustavo> the .so name, which isn't nice or portable.

Committed, thanks.

-- 
Bye, Peter Korsgaard
