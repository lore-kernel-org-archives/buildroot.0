From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Feb 2021 21:35:39 +0100
Subject: [Buildroot] [RFC PATCH] stm32mp1: modify gpt partitions to fix
 BSP update
In-Reply-To: <YB75BHzVtUdwxWLv@curiosity> (Sergey Matyukevich's message of
 "Sat, 6 Feb 2021 23:16:04 +0300")
References: <20210130204456.793098-1-geomatsi@gmail.com>
 <87eeht5bnx.fsf@dell.be.48ers.dk> <YB75BHzVtUdwxWLv@curiosity>
Message-ID: <871rdt53z8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergey" == Sergey Matyukevich <geomatsi@gmail.com> writes:

Hi,

 >> If upstream wants to use a separate partition for the environment, then
 >> that is fine by me - But I would prefer to not patch u-boot and just
 >> name the environment partition ssbl.

 > Sure, I would also prerfer not to patch u-boot. However on stm32mp1
 > platform, ATF attempts to load BL33 bootloader from 'ssbl' partition.
 > So using this name for environment partition does not work.

So is upstream U-Boot broken? Why doesn't it get fixed? Sorry, I don't
follow?


-- 
Bye, Peter Korsgaard
