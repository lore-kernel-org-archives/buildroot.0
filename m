From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2014 14:18:08 +0200
Subject: [Buildroot] [PATCH] openntpd: add SysV initscript and user
In-Reply-To: <1402486395-15125-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 11 Jun 2014 08:33:15 -0300")
References: <1402486395-15125-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pphgxcvz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Add the _ntp user that the daemon requires to work in any way.
 > Add a SysV-style initscript as well, but not with '-s' (set time
 > immediately after startup) because it can make the boot process stall
 > for a few seconds if there's no proper network connectivity/dns setup.
 > Make ntp and openntpd mutually exclusive since they overstep each other.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
