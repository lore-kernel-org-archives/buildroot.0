From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Jun 2013 19:40:58 +0200
Subject: [Buildroot] [PATCH] sconeserver/libedbus: fix missing avr32
	arch exclusions
In-Reply-To: <1372341791-18200-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 27 Jun 2013 11:03:11 -0300")
References: <1372341791-18200-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a9mb3105.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fix missing avr32 arch exclusions regarding bluez_utils being
 Gustavo> unavailable. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/789/78901c36517b1d897a1200ccddd79afec8a605de/

Committed, thanks.

-- 
Bye, Peter Korsgaard
