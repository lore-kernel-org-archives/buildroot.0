From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 3 Jan 2017 17:10:02 +0100
Subject: [Buildroot] Perl-related bug, #9291
In-Reply-To: <20161205230049.5f67d397@free-electrons.com>
References: <20161015182827.5d030d2d@free-electrons.com>
 <CAGhdn57yw=BXk7ZW2JLtf4OXYhR0Ziq5Z4u55uESdoFvrUMAvA@mail.gmail.com>
 <20161205230049.5f67d397@free-electrons.com>
Message-ID: <CAB0FRsuU_HkZ0MO=vSa7jp2Dd7RhU9LZqEqF+4oz4zNtDA1mkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-12-05 23:00 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Fri, 21 Oct 2016 22:02:27 +0200, Fran?ois Perrad wrote:
>
>> I fill a ticket https://github.com/arsv/perl-cross/issues/41
>
> This issue has been fixed. Could you take care of doing the necessary
> changes to the perl package?
>
> It also looks like perl-cross has some more recent releases, like
> 1.1.1, but there are some significant changes. According to the 1.1.0
> changelog:
>
>  * Major code cleanup
>  * Package name changed to perl-cross-N.M.tar.gz
>  * Support for multiple perl versions
>
> If you could have a look, it would be nice. If bumping to 1.1.1 for now
> is too complicated, then a patch that at least backports the message
> queues related fix would be good to have.
>
> Thanks,
>

Fixed with perl-cross-1.1.2

Fran?ois

> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
