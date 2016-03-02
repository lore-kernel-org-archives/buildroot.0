From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Mar 2016 23:02:20 +0100
Subject: [Buildroot] [PATCH] x265: depends on BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1456954411-6865-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 2 Mar 2016 18:33:31 -0300")
References: <1456954411-6865-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mvqga68j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It uses __sync_fetch_and_add_4() and other 32-bit atomics, fixes:
 > http://autobuild.buildroot.net/results/6cf/6cf4cdfdcd00f92176fd8a901884a3fd0c784f24/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
