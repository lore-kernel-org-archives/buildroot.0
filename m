From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Dec 2012 15:36:29 +0100
Subject: [Buildroot] [PATCH] Makefile: fix cross target
In-Reply-To: <1356012991-32494-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Thu, 20 Dec 2012 15:16:31 +0100")
References: <1356012991-32494-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87pq24yemq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

Hi,

 Fabio> The cross target was laking some dependency.
 Fabio> Now it's possible to successfully use the target right
 Fabio> after the configuration.

The fix is fine, but what exactly is your use case for using 'make
cross'? It's not documented anywhere, and I was thinking about dropping
it.

-- 
Bye, Peter Korsgaard
