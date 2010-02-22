From: Nuno Pereira <fxss@iol.pt>
Date: Mon, 22 Feb 2010 19:14:16 +0000
Subject: [Buildroot]  undefined reference to copysignl
Message-ID: <13abadeb1002221114g418b17fl13668ec1d4018a65@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 12 Feb 2010 19:38:41 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Something like
>  http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00237.html
> maybe ?

Well, this patch was controversial it seems. The OpenWRT guys have
instead integrated a fix for uClibc:
 https://dev.openwrt.org/browser/trunk/toolchain/uClibc/patches-0.9.30.1/450-powerpc_copysignl.patch?rev=18178

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

Hi,

I'm a kind of rookie so how can I apply this patch? Is it included in
some buildroot snapshot?

Thanks + Regards,
Nuno
