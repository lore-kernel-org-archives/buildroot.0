From: Oli Vogt <oli.vogt.pub01@gmail.com>
Date: Sun, 24 Aug 2014 19:56:05 +1200
Subject: [Buildroot] Phidgets library and web server?
In-Reply-To: <alpine.DEB.2.02.1408241012500.2336@tavas.tkos.co.il>
References: <alpine.DEB.2.02.1408241012500.2336@tavas.tkos.co.il>
Message-ID: <CAAwwcmTX=n7ABYMwMALFN18s6W18Ta+RdnpDtScfut5+MFGCPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jonathan Ben Avraham

Thank you for your offer.
I have not used Phidgets yet but would certainly be interested in having
this package in my buildroot-repertoir.

Kind regards, oli

PS:
I'm working with the i.MX233 at the present.



On 24 August 2014 19:40, Jonathan Ben Avraham <yba@tkos.co.il> wrote:

> Dear Buildroot colleagues,
> I have integrated the Phidgets (http://www.phidgets.com/)
> libphidget-2.1.8.20140319 and phidgetwebservice into my Buildroot tracking
> branch.
>
> I have tested on x86 and i.MX287.
>
> The Phidgets software license is LGLP Version 3. No publicly accessible
> repo, just tarball downloads.
>
> Uses autoconf build system.
>
> Requires glibc and libusb.
>
> From the Phidgets site:
>
> "Phidgets are a set of user friendly building blocks for low cost USB
> sensing and control from your PC."
>
> My client is using Phidgets products on a custom i.MX287 board rather than
> a PC, for control of a home kitchen and restaurant appliance using GPIO's
> and ADC's. I personally have no commercial interest in Phidgets.
>
> I can commit to maintaining for six months on arm, x86 and ppc.
>
> My question to you is, is this the type of package that we want to add to
> Buildroot? Should I submit patches? Or is there a "contrib" dir where I
> could put the patches?
>
> Best regards,
>
>  - yba
>
>
> --
>  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
> =}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo---------
> ---{=
> mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il
> skype:benavrhm
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140824/982df179/attachment.html>
