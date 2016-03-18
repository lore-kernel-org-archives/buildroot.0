From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 22:11:45 +0100
Subject: [Buildroot] [PATCH v2] openpgm: depends on sync2/sync4
In-Reply-To: <1458155700-7383-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 16 Mar 2016 16:15:00 -0300")
References: <1458155700-7383-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y49f1ofi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Add dependency on BR2_TOOLCHAIN_HAS_SYNC_2/4 since it uses both
 > __sync_fetch_and_add_2() and __sync_fetch_and_add_4() atomic builtins.
 > Fixes:
 > http://autobuild.buildroot.net/results/8f2/8f2a3571611dc9414c23808e7615f87b677557dd/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 > v2: get rid of bfin conditional since it's atomics-related

Committed, thanks.

-- 
Bye, Peter Korsgaard
