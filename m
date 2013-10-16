From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 16 Oct 2013 10:40:17 +0100
Subject: [Buildroot] [PATCH] ext-toolchain: MIPS: Select correct
 endianness for the target
In-Reply-To: <20131014122655.76c12547@skate>
References: <1381744345-8306-1-git-send-email-markos.chandras@imgtec.com>	<20131014120543.267c23a7@skate>	<525BC5C1.3050705@imgtec.com>
 <20131014122655.76c12547@skate>
Message-ID: <525E5F01.3000006@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/13 11:26, Thomas Petazzoni wrote:
> Dear Markos Chandras,
>
> On Mon, 14 Oct 2013 11:21:53 +0100, Markos Chandras wrote:
>
>>> Should we do it for -EB as well? Or do we consider because the Sourcery
>>> toolchain defaults to big endian we don't need to explicit -EB ?
>>
>> It's not necessary because the default is for big endian. But if you
>> prefer to do that for the sake of consinstency I am fine with it :)
>>
>> Peter can you fix this patch before you commit it or should I send a v2?
>
> I have a bunch of other external toolchain / toolchain patches, so I
> can take your patch as well and send a global patch series to Peter.
>
> Thanks!
>
> Thomas
>
Hi Thomas,

Oh that would be great! Would you be able to remove the redundant
"ifeq ($(BR2_ENDIAN),"LITTLE")" or should I send a new patch? :)

-- 
markos
