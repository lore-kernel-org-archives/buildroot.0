From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 22 Dec 2019 15:49:44 +0100
Subject: [Buildroot] [PATCH 2/3] package/perl-math-bigint: new package
In-Reply-To: <CAAXf6LU-zg05NszgCjvobzyCk_urdg=rf8QA6B047vt6_=rSKA@mail.gmail.com>
References: <20191218201845.846-1-patrickdepinguin@gmail.com>
 <20191218201845.846-2-patrickdepinguin@gmail.com>
 <CAB0FRsstnQ_nNhd-CHk3ZKJNbtOW3NSEgiPWjSdEGK8vEQcoPw@mail.gmail.com>
 <CAAXf6LU-zg05NszgCjvobzyCk_urdg=rf8QA6B047vt6_=rSKA@mail.gmail.com>
Message-ID: <CAB0FRsvybWys8NP+KbN2U5qKTj=XyysfnrR7KjOb1k4+71is2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 22 d?c. 2019 ? 14:27, Thomas De Schampheleire <
patrickdepinguin@gmail.com> a ?crit :

> Hi Fran?ois,
>
> On Sun, Dec 22, 2019, 13:07 Fran?ois Perrad <francois.perrad@gadz.org>
> wrote:
>
>>
>> Math::BigInt is a core module.
>> Perl 5.30.1 includes the version 1.999816.
>> From my point of view, this package is useless.
>>
>
>
> How do you know this?
>

Perl comes with the module Module::CoreList which contains all these data,
and the utility `corelist`.


> The cpan page does not give such detail, it seems.
> https://metacpan.org/pod/Math::BigInt
> And what about math-prime-util?
>
>
$ corelist Math::Prime::Util

Data for 2017-09-22
Math::Prime::Util was not in CORE (or so I think)


> Do you know since which perl release this is a core package?
>
>
$ corelist Math::BigInt

Data for 2017-09-22
Math::BigInt was first released with perl 5

Fran?ois


> Thanks
> Thomas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191222/b2bbff90/attachment.html>
