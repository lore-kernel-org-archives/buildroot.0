From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Feb 2014 20:48:18 +0100
Subject: [Buildroot] [pkg-perl infra V4 1/9] pkg-perl: refactor and
 rename PERL5LIB
In-Reply-To: <CAB0FRsu9SYR5z6Sw3LApXVV1K+onF7eT0yNGnebr4G1pTvEJHw@mail.gmail.com>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
 <1391608380-23240-2-git-send-email-francois.perrad@gadz.org>
 <20140205165500.676cac50@skate>
 <CAB0FRsu9SYR5z6Sw3LApXVV1K+onF7eT0yNGnebr4G1pTvEJHw@mail.gmail.com>
Message-ID: <20140205204818.530415bc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Wed, 5 Feb 2014 20:44:54 +0100, Fran?ois Perrad wrote:

> > I think it was requested in a previous review: the commit log should
> > indicate *why* PERL5LIB should be used instead of PERLLIB.
> 
> The official Perl documentation refers only to PERL5LIB.
> PERLLIB is obsolete, we don't need to be compatible with Perl4.

Thanks for the explanation, but please include it in the commit log for
the next revision of your perl infrastructure patch series.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
