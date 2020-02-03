From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 3 Feb 2020 22:51:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: use system portaudio
 instead of bundled one
In-Reply-To: <20200203223858.79181c44@windsurf>
References: <20200203211559.2529379-1-fontaine.fabrice@gmail.com>
 <20200203223858.79181c44@windsurf>
Message-ID: <CAPi7W83pufau8SkrQ9B0rsSbiC48xydLGMKx-3ZKN=2S7fVzFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le lun. 3 f?vr. 2020 ? 22:39, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Mon,  3 Feb 2020 22:15:59 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Are you sure there's a bundled one? I don't really see it, and the
> aconfigure.ac logic is not very clear. How did you find this ? Could
> you give some more details ?
You're right, bundled portaudio was removed from libpjsip 4 years ago
with https://trac.pjsip.org/repos/ticket/1906.
I'll send a v2 to make portaudio an optional dependency.
>
> It seems like libpjsip can use ALSA, in which case it doesn't need
> PortAudio. So it would be nice to have more details from you about this
> change.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
