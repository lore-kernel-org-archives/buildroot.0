From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Apr 2012 10:56:12 +0200
Subject: [Buildroot] [PATCH 2/2] lsof: add busybox tweaks
In-Reply-To: <1335435324-18792-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 26 Apr 2012 07:15:24 -0300")
References: <1335435324-18792-1-git-send-email-gustavo@zacarias.com.ar>
 <1335435324-18792-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87397m9as3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Since busybox 1.20+ includes a lsof applet make sure lsof gets
 Gustavo> built after busybox so that we get the full-blown version if
 Gustavo> both are enabled.  Also hide the lsof package unless
 Gustavo> BUSYBOX_SHOW_OTHERS is true.

Committed, thanks.

-- 
Bye, Peter Korsgaard
