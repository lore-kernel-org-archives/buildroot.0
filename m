From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Feb 2011 22:50:34 +0100
Subject: [Buildroot] [PATCH 5/5] mpd: fix mpd.conf installation check
In-Reply-To: <1297257953-8381-5-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Wed, 9 Feb 2011 10:25:53 -0300")
References: <1297257953-8381-1-git-send-email-gustavo@zacarias.com.ar>
	<1297257953-8381-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pqr0j2s5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> If target /etc/mpd.conf exists the evaluation will be fail thus breaking
 Gustavo> the build process. Fix it.

Committed, thanks.

-- 
Bye, Peter Korsgaard
