From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Mar 2012 00:07:06 +0100
Subject: [Buildroot] [PATCH 6/6] apply-patches.sh: use series file to
	apply patches in proper order
In-Reply-To: <1331739237-29872-7-git-send-email-ludovic.desroches@atmel.com>
 (ludovic desroches's message of "Wed, 14 Mar 2012 16:33:57 +0100")
References: <20120314120310.13e0ea3a@skate>
 <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
 <1331739237-29872-7-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <871uomkh2d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ludovic" == ludovic desroches <ludovic.desroches@atmel.com> writes:

 ludovic> From: Ludovic Desroches <ludovic.desroches@atmel.com>

 ludovic> If a series file is present use it to determine the proper
 ludovic> order to apply patches instead of using ls sorting order.

Committed, thanks.

-- 
Bye, Peter Korsgaard
