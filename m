From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 17:39:34 +0100
Subject: [Buildroot] Mono package
In-Reply-To: <CA+R-mPPYzHxdfxvfcmo=bzEhd9A4rs1Gsf9=onaYxjh74VAmLA@mail.gmail.com>
References: <CA+R-mPPYzHxdfxvfcmo=bzEhd9A4rs1Gsf9=onaYxjh74VAmLA@mail.gmail.com>
Message-ID: <20131101173934.63cf0a93@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mirek Frajkowski,

On Fri, 1 Nov 2013 15:29:31 +0000, Mirek Frajkowski wrote:

> I would like to contribute to buildroot by sending Mono package, which I
> believe many people will find useful.

Nice, thanks!

> Mono has to be cross compiled in two steps:
> 
> 1. Native code - for the virtual execution system, garbage collector and
> other unmanaged bits
> 2. Managed code - this includes C# compiler, assembler, class libraries and
> so on
> 
> Due to this fact it is divided into two sub-folders/sub-packages. The build
> configuration itself is not very complicated, however one thing is worth
> pointing out.
> 
> Mono signs its binary files and thus we have to disable stripping of the
> binaries in the buildroot, which is done through "Config.in" file.
> 
> Everything else is pretty much straight forward and self explanatory.
> 
> Package is also installed in staging directory, just in case someone needs
> to compile other packages which depend on Mono.
> 
> Please find the Mono package attached.

Can you send this as one or several patches, with the patches inline.
See
http://buildroot.org/downloads/manual/manual.html#_contributing_to_buildroot
for details on how to contribute to Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
