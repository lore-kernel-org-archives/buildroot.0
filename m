From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 20 Apr 2014 19:12:56 +0200
Subject: [Buildroot] [PATCH 2/2] perl-cross: bump to version 0.8.5
In-Reply-To: <20140420173730.1770c6e1@skate>
References: <1398006356-5425-1-git-send-email-francois.perrad@gadz.org>
 <1398006356-5425-2-git-send-email-francois.perrad@gadz.org>
 <20140420173730.1770c6e1@skate>
Message-ID: <CAB0FRsuktZr9dubswhhRZQ=ReAZaJVtZNVcautexGnR7_e1cNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-04-20 17:37 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Sun, 20 Apr 2014 17:05:56 +0200, Francois Perrad wrote:
>
>> -PERL_CROSS_VERSION = 0.8.3
>> -PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
>> -PERL_CROSS_SITE    = http://download.berlios.de/perlcross
>> +PERL_CROSS_VERSION = 0.8.5
>> +PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).2
>> +PERL_CROSS_SITE    = http://raw.github.com/arsv/perl-cross/releases
>
> You should use the $(github ...) helper here.
>

No. I've already tried it. The helper doesn't give the same result.

I need a tarball which allows to patch the perl distribution.
The helper gives a copy of the project which allows to build this tarball.

Fran?ois

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
