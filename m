From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Feb 2017 21:21:54 +0100
Subject: [Buildroot] [PATCH master] dbus: security bump to version
	1.10.16
In-Reply-To: <20170216191436.18244-1-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Thu, 16 Feb 2017 16:14:36 -0300")
References: <20170216191436.18244-1-gustavo@zacarias.com.ar>
Message-ID: <87r32xga3h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > * Symlink attack in nonce-tcp transport.
 > * Symlink attack in unit tests.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

I've committed my patch doing the same as it had a more detailed commit
message, thanks.

-- 
Bye, Peter Korsgaard
