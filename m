From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 May 2013 15:04:04 +0200
Subject: [Buildroot] [PATCH] samba: add option for built-in debug
	messages
In-Reply-To: <1367669205-1745-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 4 May 2013 09:06:45 -0300")
References: <1367669205-1745-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ip2yvquz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> This option allows users to specify the maximum level for compiled-in
 Gustavo> debug messages with -1 being none.
 Gustavo> In a typical scenario of nmbd+smbd+smbpasswd this can save a full
 Gustavo> megabyte of target space.

Committed, thanks.

-- 
Bye, Peter Korsgaard
