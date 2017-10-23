From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 23 Oct 2017 21:10:31 +0200
Subject: [Buildroot] [PATCH RFC] package/glibc: switch to using the
 maintenance branch
In-Reply-To: <20171021122223.GB7022@scaer>
References: <20171021102206.29477-1-yann.morin.1998@free.fr>
 <38b149b1-8f27-d747-3b16-be54b43cdbd4@gmail.com>
 <20171021122223.GB7022@scaer>
Message-ID: <4d73920f-4566-08f2-ba7c-abdfcb8794c8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 21/10/2017 ? 14:22, Yann E. MORIN a ?crit?:
> Romain, All,
> 
> On 2017-10-21 13:31 +0200, Romain Naour spake thusly:
>> Le 21/10/2017 ? 12:22, Yann E. MORIN a ?crit?:

[...]

> 
>> I guess it's a gitconfig issue. Maybe I should increase a buffer somewhere.
>>
>> Otherwise, it looks good.
>>
>> Note: My patch fixing gcc5.5 x86_64 toolchains whith glibc 2.26 is not yet
>> backported to the stable branch.
>> Maintainers are waiting some days before backporting a patch.
>>
>> https://sourceware.org/git/?p=glibc.git;a=commit;h=386e1c26ac473d6863133ab9cbe3bbda16c15816
>>
>> Maybe you can include it in this patch.
> 
> No, I won't. This commit is about just switching (and bumping as you
> noticed). We can wait a bit more until your commit is applied and when
> we're ready to tag 2017.11-rc1, and then bump to the latest HEAD of the
> branch.

I can respin your patch with an updated commit hash that include this patch [1].

But I don't know how to deal with the download issue...

Best regards,
Romain

[1]
https://sourceware.org/git/?p=glibc.git;a=commit;h=f8279a4b3cc66d3ec8bfb8519e9987b8f7727f53

> 
> Regards,
> Yann E. MORIN.
> 
>> Best regards,
>> Romain
