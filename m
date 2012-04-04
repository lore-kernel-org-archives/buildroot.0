From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Apr 2012 22:46:30 +0200
Subject: [Buildroot] [PATCH] toolchain/microblaze: fix up big-endian
	characteristics
In-Reply-To: <1332186504-27410-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 19 Mar 2012 16:48:24 -0300")
References: <1332186504-27410-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ehs3tec9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The big-endian microblaze external toolchain is missing vital
 Gustavo> characteristics being set, such as LARGEFILE support, IPV6 and
 Gustavo> so on.

Committed, thanks.

-- 
Bye, Peter Korsgaard
