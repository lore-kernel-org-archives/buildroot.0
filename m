From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 26 Apr 2021 19:57:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: security bump to
 version 2021.04
In-Reply-To: <87y2d5hqvm.fsf@dell.be.48ers.dk>
References: <20210418194332.3464292-1-fontaine.fabrice@gmail.com>
 <87mttlkyr6.fsf@dell.be.48ers.dk>
 <CAPi7W80hoZtMnQytcOJbs5B3twa_CUyp1gXQBjDY_Fs8YNS5xw@mail.gmail.com>
 <87y2d5hqvm.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W837kHX_xCngT_nDpaXAj9+ixYyymndNK=2e54ZnTTZ=Jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 26 avr. 2021 ? 19:56, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > Le lun. 26 avr. 2021 ? 14:37, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>  >>
>  >> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>  >>
>  >> > - Fix CVE-2021-27097: The boot loader in Das U-Boot before 2021.04-rc2
>  >> >   mishandles a modified FIT.
>  >> > - Fix CVE-2021-27138: The boot loader in Das U-Boot before 2021.04-rc2
>  >> >   mishandles use of unit addresses in a FIT.
>  >>
>  >> Are these really bugs in uboot-tools, E.G. the (host-side) tools and not
>  >> in u-boot itself?
>  > Indeed, these CVEs are affecting uboot and not uboot-tools.
>
> Ok, thanks.
>
> I BTW noticed quite some build errors in uboot-tools since the bump:
>
> http://autobuild.buildroot.net/?reason=host-uboot-tools-2021.04
Indeed, should be fixed by
https://git.buildroot.net/buildroot/commit/?id=a8eef7d2e62aba92fbab3906862c6422410c8677
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
