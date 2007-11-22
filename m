From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Thu, 22 Nov 2007 11:03:31 +0200
Subject: [Buildroot] Undefined instruction on PXA270
In-Reply-To: <20071121233524.GB11890@buzzloop.caiaq.de>
References: <20071121233524.GB11890@buzzloop.caiaq.de>
Message-ID: <474545E3.9090109@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'd suggest trying to build compatible toolchain for ARM, armv4 for example 920T
and build kernel separately with other good toolchain.
And next to compare by objdump generated code by armv4 and xscale toolchain.

Post your gcc --dumpspecs

Daniel Mack wrote:
> Hi,
> 
> we've been trying to hunt a bug of our buildroot based rootfs here
> without success. The platform is based on a PXA270 (Compulab's EM-X270)
> and buildroot is a recent svn checkout.
> 
> The buildroot config is attached. Any ideas where to dig?
> 
> Thanks and best regards,
> Daniel
> 

Regards,
Ivan

-- 

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
