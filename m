From: =?windows-1252?Q?Guillaume_GARDET_-_Olis=E9o?= <guillaume.gardet@oliseo.fr>
Date: Mon, 30 Mar 2015 14:50:55 +0200
Subject: [Buildroot] [PATCH] sdl2: new package
In-Reply-To: <20150313171451.197d5822@free-electrons.com>
References: <1424944071-6473-1-git-send-email-guillaume.gardet@oliseo.fr>
 <20150313171451.197d5822@free-electrons.com>
Message-ID: <551946AF.6090008@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 13/03/2015 17:14, Thomas Petazzoni a ?crit :
>> +	help
>> +	  Simple DirectMedia Layer 2 - SDL2 is a library that allows
>> +	  programs portable low level access to a video framebuffer,
>> +	  audio output, mouse, and keyboard. It is not compatible with SDL1.
>> +
>> +	  http://www.libsdl.org/
> Did you check with very basic toolchains that SDL2 builds fine? I'm
> surprised you have really zero dependency on toolchain features. Can
> you check for example with the following configurations:
>
>    http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config
>    http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config
>    http://autobuild.buildroot.org/toolchains/configs/bfin-linux-uclibc.config

The 3 are ok.

>    http://autobuild.buildroot.org/toolchains/configs/bfin-uclinux.config

This one fails with:
"dlfcn.h: No such file or directory"

WHat would be the right "dpends on" option?


Guillaume
