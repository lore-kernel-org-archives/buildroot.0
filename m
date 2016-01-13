From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 21:43:08 +0100
Subject: [Buildroot] [PATCH] openntpd: set time immediately from
	initscript
In-Reply-To: <1452688144-5079-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 13 Jan 2016 09:29:04 -0300")
References: <1452688144-5079-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871t9l5hyb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Match the systemd service file and set time immediately on startup
 > rather than small steps when it differs a lot.
 > On embedded scenarios this is better since boards that lack a
 > battery-backed RTC might start at unix epoch and the time set will delay
 > for quite a while otherwise.
 > For boards that do have a battery-backed RTC the behaviour will be
 > practically the same unless the RTC drifts a lot.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
