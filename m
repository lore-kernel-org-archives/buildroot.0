From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 29 Aug 2016 10:54:11 -0700
Subject: [Buildroot] Nearly duplicate builds
In-Reply-To: <da0b7f23-509b-82b0-26cf-3d30a9e2d264@mind.be>
References: <CAK7rcp8xDcHTkxyd_E0QNPGy37R0693iMUGAWnRb4_akA8a8pg@mail.gmail.com>
 <da0b7f23-509b-82b0-26cf-3d30a9e2d264@mind.be>
Message-ID: <CAJJ6jxu3mrBgg82c1p2neOno9CtkmimzjrE2G=9BL=RRbfpcDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Arnout,

On Sat, Aug 27, 2016 at 4:46 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Kenneth,
>
>  What you're asking is unfortunately not simple...
>
snip
> externally. Any host tools that are needed by this script can be included in the
> external toolchain.
>

Please explain this line?

It seems to me with an external toolchain, the biggest overhead after
a make clean is the host tools (especially if you build the linux
kernel separately too). If you need python or some other big package
building the host stuff is a major time sink. It would be wonderful if
the host tools could also be external to the build like the toolchain.
I did not know they could be part of the external toolchain?

Thanks, Steve
