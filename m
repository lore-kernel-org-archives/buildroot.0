From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Jun 2014 21:23:43 +0200
Subject: [Buildroot] [PATCHv2] wpa_supplicant: bump to version 2.2
In-Reply-To: <1401971649-21728-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 5 Jun 2014 09:34:09 -0300")
References: <1401971649-21728-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ioofnosg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Patches are now upstream.
 > Enable epoll support since any modern kernel/toolchain supports it.

 > Interworking requires Hotspot functionality which we didn't enable
 > before so introduce a new option for them.

 > While at it group and sort the options in a more lean and friendly way.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
