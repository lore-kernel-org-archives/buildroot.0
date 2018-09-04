From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 4 Sep 2018 15:50:13 +0100
Subject: [Buildroot] [PATCH 1/1] arch: add support for RISC-V 64-bit
 (riscv64) architecture
In-Reply-To: <20180904094954.0af85c8e@windsurf>
References: <20180831091154.22530-1-mark.corbin@embecosm.com>
 <20180902214024.464f8a25@windsurf>
 <8e07a0c3-6132-c94c-5732-fc48339878bf@embecosm.com>
 <de6c6241-cffd-e5b4-c25b-2849399fa3c1@mind.be>
 <20180904094954.0af85c8e@windsurf>
Message-ID: <18613d72-b2a4-3a00-bd1f-3dc726e2b560@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 04/09/18 08:49, Thomas Petazzoni wrote:
> Speaking of which, what would be the effect of this atomics option on the
>> _HAS_SYNC options?
> Ah, that's a good point, all the BR2_TOOLCHAIN_HAS_SYNC_{1,2,4,8}
> options need to be updated.

The default settings for BR2_TOOLCHAIN_HAS_SYNC_{1,2,4,8} are good (i.e.
the toolchain supports all those data sizes).

Regards

Mark

>
> Best regards,
>
> Thomas

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
