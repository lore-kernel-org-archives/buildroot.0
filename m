From: Felix Vollmer <felixvollmer@gmail.com>
Date: Thu, 11 Jun 2020 11:40:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/asterisk: bump version to
 16.10.0
In-Reply-To: <20200606232934.51a6d8de@windsurf>
References: <20200604212509.162415-1-FelixVollmer@gmail.com>
 <20200606232934.51a6d8de@windsurf>
Message-ID: <CABhhZifXw4eYCGyDO7Z6+YRHZ8a4YCTPnoyR-4uDuq+JiKvLaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks!
I actually have Asterisk running on an embedded system, which is built
by buildroot (https://github.com/fvollmer/SIP-Heating-Gateway). It is
just a small personal project and I probably will only update the
system image in case of security vulnerabilities. I'll try to have an
eye on the asterisk, but I'm not sure how much time I actually have to
maintain the buildroot asterisk package.

Am Sa., 6. Juni 2020 um 23:29 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Felix,
>
> Thanks for your contribution? Are you actually using Asterisk on
> systems built by Buildroot? We indeed don't really have a maintainer
> for the Asterisk package in Buildroot. Yann E. Morin, which you Cc'ed
> added it a while ago, but I don't think he is really using Asterisk.
> Having another person looking after our Asterisk package would be very
> nice.
>
> On Thu,  4 Jun 2020 23:25:09 +0200
> Felix Vollmer <felixvollmer@gmail.com> wrote:
>
> > Release Notes:
> > https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16-current-summary.html
> >
> > Signed-off-by: Felix Vollmer <FelixVollmer@gmail.com>
> > ---
> >  package/asterisk/asterisk.hash | 2 +-
> >  package/asterisk/asterisk.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> Applied to master, thanks.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
