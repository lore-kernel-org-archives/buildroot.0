From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Mon, 17 Dec 2012 23:08:31 +0100 (CET)
Subject: [Buildroot] [PATCH] imx-lib: new package
In-Reply-To: <50CF9377.3040100@mind.be>
References: <1355752131-31966-1-git-send-email-arnout@mind.be>
 <50CF3F4D.1030100@mind.be>
 <2112128925.1003709.1355759859440.JavaMail.root@advansee.com>
 <50CF55F7.9090906@mind.be>
 <58636407.1033142.1355773226690.JavaMail.root@advansee.com>
 <50CF9377.3040100@mind.be>
Message-ID: <500657286.1044720.1355782111169.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 17, 2012 10:49:43 PM, Arnout Vandecappelle wrote:
> On 17/12/12 20:40, Beno?t Th?baudeau wrote:
> >> >     ipu/mxc_ipu_hl_lib.h needs linux/mxcfb.h which only exists
> >> >     in the
> >> >     imx
> >> >  kernels.
> > I see. I did not have this issue because I have built a custom
> > toolchain based
> > on Freescale's kernel, so including these headers. This would not
> > be very
> > practical to impose the use of a custom toolchain here.
> 
>   I guess the custom toolchain isn't uClibc-based? Because it looks
>   like
> some of the binary packages depend on glibc.

It is indeed glibc-based.

Regards,
Beno?t
