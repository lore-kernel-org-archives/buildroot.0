From: C.A, Subramaniam <subramaniam.ca@ti.com>
Date: Tue, 22 Nov 2011 17:24:28 -0600
Subject: [Buildroot] support for TI PandaBoard?
In-Reply-To: <CALB96N=mEwGN0KN5WPKgUheZfQ147OjZO8kQBTpPRsaE45r=vQ@mail.gmail.com>
References: <CALB96N=oQ6KWsQymURs59k=dDhESBbecYvdEuro0_8ye6nCJNQ@mail.gmail.com>
 <CAPCu-pSkqQy8LPJu5aF+EzgKy+S_TskTph4m0M+8P6F7Q2kp8Q@mail.gmail.com>
 <CALB96N=mEwGN0KN5WPKgUheZfQ147OjZO8kQBTpPRsaE45r=vQ@mail.gmail.com>
Message-ID: <CAPCu-pRjLoboMeAmGWVPz-d4dLHDxSFTeH6vFFUUNmz=L6Cp7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 22, 2011 at 3:52 PM, Dechesne, Nicolas <n-dechesne@ti.com> wrote:
>
>
> On Tue, Nov 22, 2011 at 10:38 PM, C.A, Subramaniam <subramaniam.ca@ti.com>
> wrote:
>>
>> I have a similar def config that I have been using for sometime now. I
>> have been using it for Panda and SDPs as well.
>
> yeah. my goal really is to get this panda config into buildroot to make it
> obvious and simple that BR has Panda support...
>
>>
>> I do not have the
>> u-boot and spl parts though.
>>
>> Are you planning on getting something
>> working with linaro
>
> that's a good question. I believe we should stick to mainline trees for
> kernel and uboot in the default config. my feeling is that linaro is doing
> great upstreaming work on u-boot. so mainline should be fine. unless
> somebody else has a different view..
>
>>
>> / goz trees?
>
> definitely not. goz (note: stands for git.omapzoom.org) has very custom
> uboot/xloader trees used for android development, but they are too far away
> from mainline to be considered as target for inclusion in BR.
>
Great. Let me start working on one then. I would definitely need help
on this. Will ping you as I move forward.


-- 

Thank you and Regards
Subbu
