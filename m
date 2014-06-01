From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2014 20:58:33 +0200
Subject: [Buildroot] [PATCHv2 1/2] glibc: drop redundant arch depends
In-Reply-To: <1401623919-16671-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 1 Jun 2014 08:58:38 -0300")
References: <1401623919-16671-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqd04fty.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > These are already in toolchain/toolchain-buildroot/Config.in and since
 > package/glibc/Config.in is filtered by BR2_TOOLCHAIN_USES_GLIBC there's
 > no need to duplicate this.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
