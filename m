From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 03 Jan 2013 14:11:18 -0300
Subject: [Buildroot] Building For 486
In-Reply-To: <AC90E66A6CD74D73BE3BEFF9E6A04249@beraninstruments.com.local>
References: <000301cde9cd$7b4bb8e0$71e32aa0$@co.uk>
 <AC90E66A6CD74D73BE3BEFF9E6A04249@beraninstruments.com.local>
Message-ID: <50E5BBB6.5020708@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/03/2013 01:59 PM, Will Moore wrote:
> You need to ensure you use "an appropriate" kernel configuration for the
> vortex86dx and correctly configure buildroot to build the kernel with it, let me
> know if this makes no sense and you need more details...
> 
> IMHO a good starting place is the 2.6.29.6 kernel config provided by DM&P in
> their X-Linux distribution.  I say a good starting place as I have had no end of
> problems moving to more recent kernels.  (OT: I have had no end of problems with
> this CPU full-stop, I have a deep seated suspicion that the FPU is "broken" or
> at least both Linux and QNX kernels don't like it much, I run with it turned off
> and use the Linux FPE. YMMV).

I've got one of those "nice" ebox2300 boxes that use the original
Vortex86 (AKA SiS 550).
They're something like a 486-586 depending on how you look at it.
I don't know how much they carried over to the newer SX/DX/MX variants
but i vividly remember that the linux kernel configuration must be
almost perfect to boot on these.
I also recall that some kernel versions flat out don't like them, so
trying is the best option until you find a suitable one.
If you're interested i might be able to dig a kernel .config, but
remember it's a different beast from the newer variants and it might not
help at all.
Regards.
