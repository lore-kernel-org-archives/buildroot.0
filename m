From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 22 Jan 2021 08:11:07 +0100
Subject: [Buildroot] [PATCH 01/15] package/iwd: add IWD_CPE_ID_VENDOR
 and IWD_CPE_ID_NAME
In-Reply-To: <20210121220424.3d8157b2@windsurf.home>
References: <20210121133639.7332-1-heiko.thiery@gmail.com>
 <20210121220424.3d8157b2@windsurf.home>
Message-ID: <CAEyMn7aKzo36Xxqp_ubtHGDsnPQYdmBna8H6vQiCLaVnLwLqOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Do., 21. Jan. 2021 um 22:04 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Thu, 21 Jan 2021 14:36:25 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > cpe:2.3:a:intel:inet_wireless_daemon is a valid CPE identifier for this package:
> >
> > https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=iwd
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >  package/iwd/iwd.mk | 2 ++
> >  1 file changed, 2 insertions(+)
>
> I've applied the entire series. However, your series was supposed to
> have 15 patches, but the PATCH 15/15 never made it to the mailing list.
> Is this expected ?

You're right .. that was not expected. I sent patch #15 now.

Thank you.

-- 
Heiko
