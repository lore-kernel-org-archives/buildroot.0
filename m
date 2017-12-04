From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 4 Dec 2017 08:18:42 -0200
Subject: [Buildroot] [PATCH] pimd: new package
In-Reply-To: <20171203001901.62499b79@windsurf.lan>
References: <1512228242-23822-1-git-send-email-sergio.prado@e-labworks.com>
 <20171203001901.62499b79@windsurf.lan>
Message-ID: <CANu7NGtb=+UWELa7yoqE0tyEBXX+w=yYgEFLepumJSuhAQ2HsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> I was a bit confused at first, because when I looked at the code in
> http://troglobit.com/project/pimd/, it was using a traditional
> configure.ac and Makefile.am, which surely shouldn't require passing
> CROSS and CC at build time, and which also doesn't have any
> --embedded-libc option.
>
> The reason is that 2.3.2, which was released in March 2016, predates
> the introduction of autotools as the build system.
>
> Therefore, I see two possibilities here:
>
>  - You stick with 2.3.2. In this case, you should use generic-package
>    and not autotools-package, because at 2.3.2, pimd is clearly not an
>    autotools-package. It's not because it works by chance with the
>    current autotools-package infrastructure that a future subtle change
>    in the autotools-package infrastructure, which is valid for real
>    autotools package, will break this non-autotools package.
>
>  - You move to the latest Git commit, which really uses an autotools
>    based build system.

OK. I'll change to the generic-package infrastructure.

Best regards,

Sergio Prado
Embedded Labworks
https:/e-labworks.com/en

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171204/ec94da93/attachment.html>
