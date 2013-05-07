From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 May 2013 14:00:43 +0200
Subject: [Buildroot] [PATCH] configs: update boards to u-boot custom
	version option
In-Reply-To: <1367922889-3984-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 7 May 2013 07:34:49 -0300")
References: <1367922889-3984-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y5br0zkk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Some board configs where left out of the u-boot custom version
 Gustavo> migration, so do it otherwise they'll just pull the latest
 Gustavo> version which might not work and brick the device.

Committed, thanks.

-- 
Bye, Peter Korsgaard
