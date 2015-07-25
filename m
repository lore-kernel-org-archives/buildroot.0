From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 25 Jul 2015 16:04:57 +0200
Subject: [Buildroot] [V2 1/6] perl-io-socket-ssl: bump to version 2.016
In-Reply-To: <20150724165557.7152b222@free-electrons.com>
References: <1437748731-31026-1-git-send-email-francois.perrad@gadz.org>
 <20150724165557.7152b222@free-electrons.com>
Message-ID: <CAB0FRsu9MJKd8-acF4UCU87o-JanqUC2DOMYT2do0QK6WKByTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-07-24 16:55 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Fri, 24 Jul 2015 16:38:46 +0200, Francois Perrad wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 4 ++--
>>  package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> Thanks! Is this series replacing the previous one that contained Perl
> module bumps and dependency fixes?
>

Yes, I split it.
V2 contains only bumps which are my current priority before the end of
the integration window for 2015.08.

> If so, how do you intend to fix the missing dependency of many Perl
> modules on the 'perl' package, as we discussed previously in another
> thread?
>

No idea at this time.

Fran?ois

> Thanks!
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
