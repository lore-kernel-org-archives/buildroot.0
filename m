From: Willy Lambert <lambert.willy@gmail.com>
Date: Thu, 24 Jan 2013 10:03:21 +0100
Subject: [Buildroot] Boost integration
In-Reply-To: <5100E8EE.4030309@relinux.de>
References: <CAKvQZ_1g6_KHpdyYQ6H-pk6T5gx-qsW6SvaF7XBb2JJCSf7cLg@mail.gmail.com>
 <201301222220.14854.yann.morin.1998@free.fr>
 <CAKvQZ_0f+7B8N5Fp0O6tDUxYYeuUd+wD-92-ec-hvR8KzfjDoA@mail.gmail.com>
 <CAKvQZ_2XrayYK1DuVAUCDQkoeOHqv6iB2QT0b-pKy_y7AXv2bA@mail.gmail.com>
 <87libk2s6i.fsf@dell.be.48ers.dk>
 <CAKvQZ_2aGiOzea_GmPjW3x+chDSRTicmFB3+MDh8fsCgROZ8oA@mail.gmail.com>
 <87ham73n37.fsf@dell.be.48ers.dk>
 <CAKvQZ_1fD8ujBzcAhReQLwgwfkLZFyB0KXM-VB+_q6-=d1j-HA@mail.gmail.com>
 <5100E8EE.4030309@relinux.de>
Message-ID: <CAKvQZ_1GY7DZeNL0QNmDUpMo-dSa8aepYTT-wrfq7MsikqXY9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/1/24 Stephan Hoffmann <sho@relinux.de>:
> Am 23.01.2013 18:08, schrieb Willy Lambert:
>> 2013/1/23 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>>>> "Willy" == Willy Lambert <lambert.willy@gmail.com> writes:
> snip
>>>>>>>>  Willy> I can propose you a patch to be abble to select different version a
>>>>>>>>  Willy> boost in config menus. But I'm not sure that the current mk can handle
>>>>>>>>  Willy> other versions.
>>>>>>>>
>>>>>>>> We normally don't support multiple versions of a package (except for a
>>>>>>>> few minor exceptions) as that very soon becomes a support headache. Why
>>>>>>>> would you want more than 1 version?
>> Because I need boost for another framework, that is not supporting
>> latest boost versions for now. And mainlining lastest boost support
>> there is not an option (it is at best a parrallel work to do on my
>> side, but I can't be on all fires ^^). And even if it compiles, I
>> don't want to play with versionning incompatibilities beetwen boost
>> and my framework. I need the 1.42.0 version.
> Hi,
>
> isn't this a perfect use case for the source override feature?
>
> Regards

I'm sorry but I don't understand what you mean but "source override
feature", could you explain this ?

>
> Stephan
>>
>> The idea is not necessarily to maintain all boost versions, but if the
>> same script can handle several one, it's a pity to just propose the
>> last one.
>> Said differently, I have written the part that allow to choose a
>> version on the model of config files that choose kernels. If you are
>> interested in them I'll send you a patch. If you think you are Ok with
>> editing the boost.mk by hand I'll keep my patch locally.
>>
>>
>>>  Willy> I personnaly put Boost in Packages->Librairies->Boost. It is currently
>>>  Willy> in a "Other" menu.Don't you think it would be a better place ?
>>>
>>> What would Libraries->Boost contain? Just the single boost package?
>> yes, but boost is a family of librairies. But anyway I don't really
>> care about that.
>>
>>> --
>>> Bye, Peter Korsgaard
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
