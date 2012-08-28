From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 28 Aug 2012 14:06:56 +0200
Subject: [Buildroot] [UNSURE]Re:  [PATCH 1/9] perl: new package v4
In-Reply-To: <20120827235419.0486035e@skate>
References: <1346081293-18845-1-git-send-email-francois.perrad@gadz.org>
 <20120827211024.492b964e@skate>
 <CAB0FRsuKC8Ow_Fqq+iOR3uW-iENzhX3o8qz9OCDf4rr0xb3uDQ@mail.gmail.com>
 <20120827235419.0486035e@skate>
Message-ID: <CAB0FRsumcYoMJAxKin-vNdtwwO7930bj639UXTuDa07-Y5ExWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/8/27 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Mon, 27 Aug 2012 23:05:53 +0200,
> Fran?ois Perrad <francois.perrad@gadz.org> a ?crit :
>
>> miniperl is built during the full perl build, it is just a specific
>> installation.
>> There are no common step (configure, build of exe, build of modules,
>> install) between microperl and perl.
>> So, technically a merge of these packages is not easy.
>
> Ok.
>
>> I've updated microperl to the latest stable release.
>> But I think that microperl is an useless toy which will be removed
>> soon by the Perl community.
>
> As long as the long term intention is to get rid of microperl, I'm
> fine. Should we mark it "depends on BR2_DEPRECATED" ?
>

What makes sense.

Fran?ois

>> I prefer spend my time with the full perl and the CPAN modules.
>> There still a lot of work with Perl community for put my patches in
>> the upstream.
>>
>> With this today version, cpanminus really cross-compiles the modules from CPAN.
>> The Dancer web framework (my current goal) requires 22 modules from CPAN.
>> The CPAN contains more than 23000 modules. This is the challenge.
>>         ? CPAN is the language, Perl is just its syntax ? - Audrey Tang.
>
>  :-)
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
