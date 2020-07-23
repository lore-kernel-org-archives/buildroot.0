From: Andreas Naumann <dev@andin.de>
Date: Thu, 23 Jul 2020 12:29:51 +0200
Subject: [Buildroot] [PATCH v6 20/28] qt5: Fix pkgconfig search path for
 per-package infrastructure
In-Reply-To: <20200722202651.GF2296@scaer>
References: <20200701215442.GY20645@scaer>
 <5FC5B08F-2FD5-4243-934E-A11C97636D79@getmailspring.com>
 <20200722202651.GF2296@scaer>
Message-ID: <1d374f6d-16c2-a624-de2f-bfc8a6392694@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Louis-Paul, all

first of all sorry for not responding for such a long time. There are 
just too many things on my table and yes, I also have a life outside the 
computer (kids, bees, wife should probably come first ...).

However, I'm still interested in the set and veeery happy that #19 was 
finally merged. Thanks everyone for reviewing and testing!

So Louis Paul, would it be possible you send your fix as a separate 
patch and once this is in, I resend what's left from the series?

If IRC is needed for further coordination i can join, but I'm a bit 
hesitant because I can hardly handle the four different messengers that 
I'm using already.


regards,
Andreas



On 22.07.20 22:26, Yann E. MORIN wrote:
> Louis-Paul, All,
> 
> On 2020-07-22 21:48 +0200, LP C spake thusly:
>> I'm very glad that this serie has finally ended.
> 
> Oh, no, no! The series is not applied to master at all!
> 
> I've just provided some feedback while trying your patches. The original
> patches from 20 onward have not been applied...
> 
> [--SNIP--]
>>>> As for the .pc files, I think the fix should be generalised out of the
>>>> Qt world, maybe... Fopr example, we already fix the /la files in
>>>> package/pkg-generic at 324
>>>> So, as far as I can see (which can be quite short, in some cases), we
>>>> should introduce a similar generic .pc fixup.
>> I totally agree with this. I can add this on my todo list if you wish.
> 
> I'd like to, please.
> 
> [--SNIP--]
>>>>> I'm now able to use full parallel build with per-package with Qt5.
>>>>
>>>> This is really sounding good! :-)
>>>>
>>>> Andreas, Louis-Paul, I know I may be asking a lot, but I'd love to see
>>>> an updated and consolidated series reposted to the list, that aggregates
>>>> both your developments.
>>>>
>>>> Would you be willing to do that, please?
>>
>> I'm really crowded under the snow those days (you know, when you come
>> back from holidays ;) ). I'm ok to do it but in a teamwork (IRC or
>> Discord).
> 
> Thomas P. and I are always logged in on IRC. I look from ~07:30+0200 to
> ~22:00+0200, and Thomas has similar presence. Not sure about Andreas and
> Peter, though...
> 
>> I spent way too much of my personal time to fix Qt5 parallel build.
> 
> I know this can be a lot of work, and that people have a life outside of
> Buildroot (and even outside of computers, amazing! ;-] ), but having
> people, like you, who understand what is going on, and are interested in
> fixing the issue, is the only way to make progress on such topics.
> 
> By the way, we're having a virtual developper day next Monday,
> 2020-07-27, the whole day. If you are willing to join:
>      https://elinux.org/Buildroot:VirtualDeveloperDaysSummer2020
> 
> Regards,
> Yann E. MORIN.
> 
