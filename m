From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Wed, 5 Oct 2016 12:16:49 +0530
Subject: [Buildroot] [PATCH] elfutils: clarify licensing info
In-Reply-To: <798633b6-2ff6-45d4-ad74-be9702c1ea4b@free-electrons.com>
References: <1475577852-15870-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <57F3A834.6090300@imgtec.com>
 <798633b6-2ff6-45d4-ad74-be9702c1ea4b@free-electrons.com>
Message-ID: <57F4A1D9.9060408@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wednesday 05 October 2016 04:36 AM, Gustavo Zacarias wrote:
>>> +ELFUTILS_LICENSE += GPLv3+ (programs)
>>
>> Since it is separate component, it should be comma separated.
>>
>> ELFUTILS_LICENSE := $(ELFUTILS_LICENSE), GPLv3+ (programs)
>
> Most packages don't do this correctly, only a few do and i've used those
> as example, though it's no excuse. Care to fix the others?

I will add it to my todo list.

Thanks,
Rahul
