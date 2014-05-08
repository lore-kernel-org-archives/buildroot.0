From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 May 2014 16:52:41 +0200
Subject: [Buildroot] [PATCH] ulogd: forcibly disable mysql when not
	present
In-Reply-To: <1399478688-22510-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 7 May 2014 13:04:48 -0300")
References: <1399478688-22510-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87eh04cog6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Forcibly disable mysql support when we don't want it since ulogd's
 > configure script can pick up the host mysql_config thus leading to a
 > build failure.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
