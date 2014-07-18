From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 18 Jul 2014 15:00:53 +0200
Subject: [Buildroot] [PATCH 2/5] perl-io-socket-ssl: new package
In-Reply-To: <20140717230821.6e188178@free-electrons.com>
References: <1405614782-3667-1-git-send-email-francois.perrad@gadz.org>
 <1405614782-3667-2-git-send-email-francois.perrad@gadz.org>
 <20140717230821.6e188178@free-electrons.com>
Message-ID: <CAB0FRsufdYwK19vZwrQn32hnSfyGH=4xK1c1itsVbPqhK3xQ2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-07-17 23:08 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Thu, 17 Jul 2014 18:32:59 +0200, Francois Perrad wrote:
>
>> +PERL_IO_SOCKET_SSL_VERSION = 1.997
>> +PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
>> +PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR/
>
> Yet another issue with the CPAN mirror:
> http://autobuild.buildroot.org/results/5f1/5f15763397244d6f89918a8eebc6952a2895bad0/build-end.log.
>
> Any fix?

Seems not a permanent failure.
   $ wget http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-1.997.tar.gz
works fine at this time for me.

Fran?ois

>
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
