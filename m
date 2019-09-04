From: stsp <stsp2@yandex.ru>
Date: Wed, 4 Sep 2019 22:09:45 +0300
Subject: [Buildroot] clang tool-chain support?
In-Reply-To: <31dec2be-df01-ce24-e2e4-9e379da90c01@smile.fr>
References: <87d78eb1-45aa-6200-03fe-20998152fd1a@yandex.ru>
 <f9265f6b-b188-ec04-5fc7-fd5dbb8c932b@smile.fr>
 <f6b14715-2e1b-bf96-9a13-ee70901e3350@yandex.ru>
 <31dec2be-df01-ce24-e2e4-9e379da90c01@smile.fr>
Message-ID: <c9e70f64-75fc-27a2-7891-bca21f609640@yandex.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

04.09.2019 10:38, Romain Naour ?????:
>>> Also, there are some questions about clang toolchain:
>>>
>>> "The long-term goal is to have a complete clang-based toolchain. The usefulness
>>> of this is questionable however." [1]
>>>
>>> If clang can be used as a toolchain,
>> I suppose it definitely can, at least for some configurations.
>> For others it won't be selectable (for example).
> I mean "If clang can be used as a toolchain by Buildroot".
> I believe it can but needs some work especially for building userspace programs.


> For now, Buildroot can't import a prebuit clang toolchain as external toolchain.

OK, I see...
Thanks for the info and detailed explanations
of the problem. I guess the search path differences
is not the only problem here.
Since clang support is not even here:
https://www.elinux.org/Buildroot#Todo_list
I don't expect it to appear any soon. :(


> Well, that's probably true for gcc... sometime we can report a bug without
> having a reply for a long time.
>
> At least for Binutils and Glibc this is not the case, we had some feedback from
> maintainers when needed :)

Indeed, and musl too. :)


> Ok I made a mistake here. nasm is a host only package.

That would be what I need.


> Ok, you mean nasm for the target.
No-no, I meant host.
But do you mean the host packages are not
searchible in the menuconfig? I.e. I searched
with '/' for nasm and found nothing.
So I suppose it just cannot be disabled by menuconfig,
and as such, is not listed there?
yasm on target and nasm on host is a perfect
combination, I just can't find where to enable the
host nasm.
