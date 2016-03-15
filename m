From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 22:44:25 +0100
Subject: [Buildroot] [PATCH 1/7] mplayer: switch it to samba4
In-Reply-To: <1457706744-23401-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 11 Mar 2016 11:32:18 -0300")
References: <1457706744-23401-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8760wna01y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > samba(3) has been deprecated for quite some time so switch mplayer to
 > use samba4 if available.
 > It needs a little extra tweak to pick up the proper cflags since the odd
 > configure script doesn't do it.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
