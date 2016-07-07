From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
Date: Thu, 7 Jul 2016 12:32:55 -0400
Subject: [Buildroot] [PATCH 1/1] Arcturus uCP1020 BSP support.
In-Reply-To: <20160707153745.GD20199@waldemar-brodkorb.de>
References: <1467900041-4422-1-git-send-email-oleks@arcturusnetworks.com>
 <20160707153745.GD20199@waldemar-brodkorb.de>
Message-ID: <577E8437.80801@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Nothing wrong with the default one in this basic BSP support I sent to you.
Our local stuff is more complicated and has some extra patches to the 
uClibc-ng.config and that's what for we have to have the 
separate Arcturus specific uClibc-ng.config and theoretically it could 
be removed.
Please let me know if I have to do it and I will send second version 
without .../arcturus/ppc-ucp1020/configs/uClibc-ng.config.

Any other issues you noticed ?

Thank you,

Oleksandr


On 07/07/2016 11:37 AM, Waldemar Brodkorb wrote:
> HI Oleksandr,
> Oleksandr G Zhadan wrote,
>
>> The uCP1020 product family (ucp1020) is an Arcturus Networks Inc.
>> System on Modules product featuring a Freescale P1020 CPU,
>> optionally populated with 1 or 2 Gig-Ethernet PHYs,
>> DDR3, NOR Flash, eMMC NAND Flash and/or SPI Flash.
>>
>> Signed-off-by: Oleksandr Zhadan <arcsupport@arcturusnetworks.com>
>> Signed-off-by: Michael Durrant <arcsupport@arcturusnetworks.com>
>> ---
>>   .../ppc-ucp1020/configs/linux-4.1.x.config         | 2911 ++++++++++++++++++
>>   .../arcturus/ppc-ucp1020/configs/uClibc-ng.config  |  243 ++
> Is there a special need to add a separate uClibc-ng config?
> What is wrong in the default one?
>
> best regards
>   Waldemar
>
>


-- 
Oleksandr Zhadan
Arcturus Networks
T 416 621-0125 x235
F 416 621-0190
