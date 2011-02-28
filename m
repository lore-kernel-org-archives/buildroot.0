From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Feb 2011 11:50:59 +0100
Subject: [Buildroot] [PATCH] gdb: depend on host-expat to fix remote
	debugging
In-Reply-To: <1298579868-22046-1-git-send-email-bjorn.forsman@gmail.com>
	(=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Thu,
	24 Feb 2011 21:37:48 +0100")
References: <1298579868-22046-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <8739n8ph4c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

 Bj?rn> This patch fixes the following error when using GDB with gdbserver:
 Bj?rn>   warning: Can not parse XML target description; XML support was disabled at compile time
 Bj?rn>   Remote 'g' packet reply is too long: <very long line of hex chars>
 Bj?rn>   [remote debugging does not work]

 Bj?rn> Use $(HOST_CONFIGURE_OPTS) so expat is found.

Committed, thanks.

-- 
Bye, Peter Korsgaard
