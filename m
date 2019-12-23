From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Dec 2019 22:49:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/libffi: fix build failure on
 power7 and older
In-Reply-To: <20191223224442.6c62aafa@windsurf>
References: <20191223213610.142006-1-fontaine.fabrice@gmail.com>
 <20191223224442.6c62aafa@windsurf>
Message-ID: <CAPi7W82ANuDdNBnSQPw5TT=HDRFP76fqadrk9nTBBfwnpRCxew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le lun. 23 d?c. 2019 ? 22:44, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Mon, 23 Dec 2019 22:36:10 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/3ab73995b8393592c0b147670d8ff7f8ebc8c79c
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> I just applied your previous patch tonight, so I guess this one needs
> to replace the previous one, no ?
Nope, both patches are needed.
The previous one for _Float128 (not sent yet upstream) and this one
for __int128 (from upstream).
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
