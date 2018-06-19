From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jun 2018 13:58:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: enable mod_timerfd
In-Reply-To: <20180618201400.26287-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 18 Jun 2018 22:14:00 +0200")
References: <20180618201400.26287-1-bernd.kuhls@t-online.de>
Message-ID: <87fu1jouml.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Mod_timerfd uses the Linux kernel timerfd API to create and use a kernel
 > timer that delivers timer expire notifications via a file descriptor,
 > for details read

 > https://freeswitch.org/confluence/display/FREESWITCH/mod_timerfd
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
