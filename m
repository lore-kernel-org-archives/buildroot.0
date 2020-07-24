From: Andreas Naumann <dev@andin.de>
Date: Fri, 24 Jul 2020 09:17:37 +0200
Subject: [Buildroot] [PATCH v6 20/28] qt5: Fix pkgconfig search path for
 per-package infrastructure
In-Reply-To: <20200723201733.GG2296@scaer>
References: <20200701215442.GY20645@scaer>
 <5FC5B08F-2FD5-4243-934E-A11C97636D79@getmailspring.com>
 <20200722202651.GF2296@scaer> <1d374f6d-16c2-a624-de2f-bfc8a6392694@andin.de>
 <20200723201733.GG2296@scaer>
Message-ID: <58b4935f-9ce0-e591-6c46-179c81a53294@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 23.07.20 22:17, Yann E. MORIN wrote:
> Andreas, All,
> 
> On 2020-07-23 12:29 +0200, Andreas Naumann spake thusly:
>> first of all sorry for not responding for such a long time. There are just
>> too many things on my table and yes, I also have a life outside the computer
>> (kids, bees, wife should probably come first ...).
> 
> Yes, this is perfectly understandable. :-)
> (my comment was just a joke; a bad one, I agree.)
> 
>> However, I'm still interested in the set and veeery happy that #19 was
>> finally merged. Thanks everyone for reviewing and testing!
>>
>> So Louis Paul, would it be possible you send your fix as a separate patch
>> and once this is in, I resend what's left from the series?
> 
> Yes, we can address it in smaller, independent pieces, as long as they
> make sense on their own.
> 
> I think there were two major thinks in the orioginal series:
> 
>    - making the qmake infra parallel-safe
> 
>    - fixing individual packages that are not using the qmake infra
> 
> Maybe we can first concentrate on fixing the infra, and then handle
> packages.

I guess #20 is the last generic one, the rework from Louis Paul being 
even more generic.

The individual ones #24-#28 are probably still applicable. If somebody 
wants to have a look at it...

For some of the other ones I owe a response or have already agreed on a 
rework.

> 
>> If IRC is needed for further coordination i can join, but I'm a bit hesitant
>> because I can hardly handle the four different messengers that I'm using
>> already.
> 
> Well, IRC is mostly for quick back-n-forth discussions to clarify
> things, and to organise the work. It's not mandatory to join.

Yes of course. I see how it goes.

regards,
Andreas


> 
> Regards,
> Yann E. MORIN.
> 
