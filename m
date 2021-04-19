From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Apr 2021 22:44:39 +0200
Subject: [Buildroot] [PATCH 2/2] package/domoticz: drop boost date-time
 dependency
In-Reply-To: <20210419223424.274df115@windsurf.home>
References: <20210418200730.3474374-1-fontaine.fabrice@gmail.com>
 <20210418200730.3474374-2-fontaine.fabrice@gmail.com>
 <20210419223424.274df115@windsurf.home>
Message-ID: <CAPi7W83EoFQ57YxLranycWgji6rQP4MQ9=_GCAZAKFhE5NJ-tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le lun. 19 avr. 2021 ? 22:34, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sun, 18 Apr 2021 22:07:30 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > boost date-time is not a dependency since version 4.9700 and
> > https://github.com/domoticz/domoticz/commit/a3eacbc987b59dd4aa73ada24a0a6e9a0d27b740
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/domoticz/Config.in | 1 -
> >  1 file changed, 1 deletion(-)
>
> Applied to master, thanks. I'm curious: how do you notice this kind of
> change?
I was working on bumping domoticz to latest version and I noticed this
change when going through CMakeLists.txt.
Unfortunately, I should have noticed it sooner (back in 2018) but this
kind of changes can easily be missed.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
