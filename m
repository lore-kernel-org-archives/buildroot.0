From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 14:45:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/busybox: Fix hwclock for glibc
 2.31+
In-Reply-To: <c8c5fc44-7afe-d3c9-1f62-9c89ebb015e1@linux.vnet.ibm.com> (Klaus
 Heinrich Kiwi's message of "Fri, 13 Nov 2020 09:02:56 -0300")
References: <20201112164844.18731-1-klaus@linux.vnet.ibm.com>
 <87wnyqi8x4.fsf@dell.be.48ers.dk>
 <7ba2b5f8-f871-2e84-fe3c-bcea0c89d5c5@linux.vnet.ibm.com>
 <87d00hinfu.fsf@dell.be.48ers.dk>
 <c8c5fc44-7afe-d3c9-1f62-9c89ebb015e1@linux.vnet.ibm.com>
Message-ID: <87v9e9gyk4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Klaus" == Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com> writes:

Hi,

 > Thanks!

 > I'll send a similar patch to buildroot 2020.08.1 (hopefully this is
 > still active?) and 2020.02.7 (in case it's really affected - need to
 > double check) - but those will require a small change to apply on top
 > of busybox 1_31_1..

Yes, 2020.02.x (until April 2021) and 2020.08.x (until January 2021) are
still supported. 2020.02.x uses glibc 2.30 though, so it isn't needed
there.

-- 
Bye, Peter Korsgaard
