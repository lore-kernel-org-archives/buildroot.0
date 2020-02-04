From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 4 Feb 2020 10:52:54 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump to version 4.25,
 add xtensa support
In-Reply-To: <20200204093351.6393df15@windsurf>
References: <20200201084758.285234-1-bernd.kuhls@t-online.de>
 <20200201102425.1556253b@windsurf>
 <ba2c8b6f-1ccb-b077-a789-cdbe2b987915@mind.be>
 <20200204093351.6393df15@windsurf>
Message-ID: <997d58d1-758c-afd8-4580-ddf8074b3c63@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Thomas,

On 2/4/20 9:33 AM, Thomas Petazzoni wrote:
> On Tue, 4 Feb 2020 09:25:46 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> I don't feel very strongly about it, but I'm wondering if it doesn't
>>> make sense to keep BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT. There is some
>>> architecture-specific code in libnpsr, so every time we add a new CPU
>>> architecture, we would have to poentially re-add this hidden option.
>>
>>   For what it's worth, I agree with doing that. We don't want to end up in the
>> libffi situation...
> 
> Agreed. Though I don't think libnspr will ever be in the situation of
> libffi, with zillions of reverse dependencies.

I've sent a v2 for this patch after rebasing:
https://patchwork.ozlabs.org/patch/1233202/

Usually adding an architecture to nspr is about adding only type sizes. 
This has been for Microblaze, Nds2, Nios2 and Xtensa, so probably it 
will be the same for this new architecture to be supported.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
