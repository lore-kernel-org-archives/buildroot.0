From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 19 Mar 2013 22:46:07 +0100
Subject: [Buildroot] [PATCH v3] rework patch model
In-Reply-To: <20130319205655.0e163354@skate>
References: <1363598027-25900-1-git-send-email-spdawson@gmail.com>
 <20130319205655.0e163354@skate>
Message-ID: <CAHXCMMKsXKxMFyAZ1GGVdzf0wNq14ox7fz41zHfCR5v88wUqhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon, Thomas, all,

2013/3/19 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Simon,
>
> On Mon, 18 Mar 2013 09:13:47 +0000, spdawson at gmail.com wrote:
>> From: Simon Dawson <spdawson@gmail.com>
>>
>> At the Buildroot Developers Meeting (4-5 February 2013, in Brussels) a change
>> to the patch logic was discussed. See
>>
>> http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013
>>
>> for details. In summary:
>>
>> * For patches stored in the package directory, if
>>   package/<pkg>/<version>/ does exist, apply package/<pkg>/<version>/*.patch,
>>   otherwise, apply package/<pkg>/*.patch
>> * For patches stored in the global patches directory, if
>>   $(GLOBAL_PATCH_DIR)/<pkg>/<version>/ does exist, apply
>>   $(GLOBAL_PATCH_DIR)/<pkg>/<version>/*.patch, otherwise, apply
>>   $(GLOBAL_PATCH_DIR)/<pkg>/*.patch
>>
>> This patch adds the new BR2_GLOBAL_PATCH_DIR configuration item, and reworks
>> the generic package infrastructure to implement the new patch logic.
>>
>> Signed-off-by: Simon Dawson <spdawson@gmail.com>
>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>

>
> One minor nit below, but doesn't prevent from committing the patch IMO.
> Peter can probably fix that up when committing.
I agree, even if a couple of literal formatting is missing, it does
not break anything and can easily be fixed later.

Regards,


-- 
Samuel
