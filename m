From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jan 2015 21:57:50 +0100
Subject: [Buildroot] [PATCH] openssl: update cryptodev digests patch
In-Reply-To: <1422471007-19636-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 28 Jan 2015 15:50:07 -0300")
References: <1422471007-19636-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87sieuvd0x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The adaptation from commit 74dd54bf is incomplete/bad causing segfaults when
 > using cryptodev for digest offload, examples: openssh, openssl speed, others.
 > Tested on real hardware (talitos).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
