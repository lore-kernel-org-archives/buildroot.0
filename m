From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 5 Feb 2014 20:44:54 +0100
Subject: [Buildroot] [pkg-perl infra V4 1/9] pkg-perl: refactor and
	rename PERL5LIB
In-Reply-To: <20140205165500.676cac50@skate>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
 <1391608380-23240-2-git-send-email-francois.perrad@gadz.org>
 <20140205165500.676cac50@skate>
Message-ID: <CAB0FRsu9SYR5z6Sw3LApXVV1K+onF7eT0yNGnebr4G1pTvEJHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-02-05 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Wed,  5 Feb 2014 14:52:52 +0100, Francois Perrad wrote:
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/Makefile.in          |   11 +++++++----
>>  package/intltool/intltool.mk |    3 +--
>>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> I think it was requested in a previous review: the commit log should
> indicate *why* PERL5LIB should be used instead of PERLLIB.
>

The official Perl documentation refers only to PERL5LIB.
PERLLIB is obsolete, we don't need to be compatible with Perl4.

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
