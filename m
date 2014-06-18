From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2014 14:20:42 +0200
Subject: [Buildroot] [PATCH] msgpack: disable for ARC
In-Reply-To: <1402949012-19434-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 16 Jun 2014 17:03:32 -0300")
References: <1402949012-19434-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874mzi4det.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > msgpack uses the __sync_fetch_and_add() atomic primitive that is not
 > available for ARC. Fixes:
 > http://autobuild.buildroot.net/results/829/8292e67354602738cae12d8ebea83b513ba35482/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
