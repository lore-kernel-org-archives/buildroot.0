From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2011 09:01:30 +0200
Subject: [Buildroot] u-boot compiler issue
In-Reply-To: <4DCBEC13.2050802@visionsystems.de>
References: <4DCBEC13.2050802@visionsystems.de>
Message-ID: <20110517090130.7aae0ca7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2011 16:17:55 +0200
Yegor Yefremov <yegor_sub1@visionsystems.de> wrote:

> I was building u-boot with buildroots created toolchain. Everything was working except
> that pointer passed via r8 was not writable (RAM was not configured
> etc.).

Could you give more details about this analysis ?

> But if the same code was compiled with CodeSourcery everything
> was working. Here gcc configuration from buidroot:

Does the U-Boot compilation fails, or the compilation works but U-Boot
fails to run on the device ? If it's the latter, then which version of
U-Boot are you using ? Only recent versions of U-Boot work well with
gcc 4.5.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
