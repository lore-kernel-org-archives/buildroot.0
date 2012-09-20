From: Martin Peevski <martin@ronetix.at>
Date: Thu, 20 Sep 2012 09:19:56 +0300
Subject: [Buildroot] Fwd: Re:  Basic questions about using BuildRoot
In-Reply-To: <5058F058.1020806@mind.be>
References: <CAAXf6LVtXq=OhWvqL27SzQjxUjOvd4yoisp1aAOUtqNSYJ1G0Q@mail.gmail.com>
 <5055A940.7070802@ronetix.at>
 <CAAXf6LXt1+Ee4B9BDE2ocj=6MqY0QdV5gMhn0x9JyTXR3zfyEw@mail.gmail.com>
 <5055C935.3050108@ronetix.at>
 <CAAXf6LUrzxDXUmLdwkKZFaB-H_q_XC+ybkt+_bBZO=0EgfbffA@mail.gmail.com>
 <5058F058.1020806@mind.be>
Message-ID: <505AB58C.3030805@ronetix.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/12 01:06, Arnout Vandecappelle wrote:
> On 09/17/12 12:43, Thomas De Schampheleire wrote:
>> If you're only interested in the rootfs, you could use the original,
>> working u-boot and use the rootfs from buildroot. Have you tried that?
>>
>>> >
>>> >  One question beyond the theme: is it possible to build only Root FS
>>> >  compatible with some external Kernel without any tool and if so 
>>> how to do
>>> >  that?
>
>  Indeed, it is entirely possible to use buildroot to build a rootfs and
> combine it with a pre-built kernel.  There is usually no dependency
> of an executable on a specific kernel version, because the kernel
> ABI is backward-compatible. When you build an internal or
> crosstool-NG toolchain in buildroot, however, do make sure that
> you use kernel headers with a sufficiently low version (smaller than
> or equal to the pre-built kernel you use).
>
>  If you do want to build a custom kernel later on, you need two
> things: the source and the config. Whoever gave you the kernel
> binary is also obliged to give you the source (GPL), so that should
> be doable. The config you can usually get from the running kernel,
> in /proc/config.gz.
>
>
>  Good luck!
>
>  Regards,
>  Arnout
>


      Hi again! Thank you for the help. All my attempts to build Linux 
with external version of U-boot and Kernel and the rootfs from buildroot 
was unsuccessfull. However I get older directory tree and programs and 
make rootfs with the Linux command mkfs.jffs2. To that moment it works, 
thank for you time and help!
