From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 8 Nov 2018 09:44:24 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-11-07
In-Reply-To: <20181108070039.3833C2072B@mail.bootlin.com>
References: <20181108070039.3833C2072B@mail.bootlin.com>
Message-ID: <20181108094424.GB5914@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu,  8 Nov 2018 08:00:39 +0100 (CET), Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
 
> Build statistics for 2018-11-07
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  19 |   6 |   0 |  25 |
>    2018.08.x |  14 |   4 |   0 |  18 |
>       master | 162 |  19 |   0 | 181 |
> 
> Results for branch '2018.02.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                 p11-kit-0.23.2 | 2 
>        xproto_inputproto-2.3.2 | 2 
>                   boost-1.66.0 | 1 
>                qt5webkit-5.9.1 | 1 
> 
> 
> Detail of failures
> ------------------
> 
>      powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/cf63500de2d19a67f2992cce531aa269d6785cd0 |     
>         m68k |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/cfea3172fe9f9541fcb99b5dcd2926288d449183 | ORPH
>       x86_64 |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/a0ae58531f7ba46a6115022739996eb0bc24698f | ORPH
>       mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/82e2f7d000eb759005f3c325ede7020eb661652f |     

This QtWebKit build failure looks similar to this other one that was just
fixed a few days ago, by disabling the JIT support for MIPS R6:

  http://autobuild.buildroot.net/results/eeaf3edbf6f5bf468b10adc3d053f703c6ceba96/

The patch was this one:

  https://patchwork.ozlabs.org/patch/993066/

Unfortunately I am not familiarized with the Qt5 build process and I don't
have time myself to figure out how to do that for this package ? at least
I hope the hint above helps :)

Cheers,


-Adri?n

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181108/43f57d4d/attachment.asc>
