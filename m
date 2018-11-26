From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 22:58:00 +0100
Subject: [Buildroot] [PATCH v2 2/2] grpc: new package
In-Reply-To: <CALxq1w5ZqCiG3CMZ1VRO25=mf3mWhJJ2+_+oArteVk7GzUQADw@mail.gmail.com>
References: <20181118211942.28839-1-robertroyrose@gmail.com>
 <20181118211942.28839-2-robertroyrose@gmail.com>
 <20181124151256.5b786338@windsurf>
 <CALxq1w45Krr6E8Ri7rxrDN9USkbPdLbqmmK2x-XiH3AmHHeqpg@mail.gmail.com>
 <20181124214519.5d168fd8@windsurf>
 <CALxq1w6H6h3BY6R=PyuTAqHh6JtJyjVWg7F8DUnChMhyMaP1yw@mail.gmail.com>
 <CALxq1w5ZqCiG3CMZ1VRO25=mf3mWhJJ2+_+oArteVk7GzUQADw@mail.gmail.com>
Message-ID: <20181126225800.40584f11@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Robert,

On Sat, 24 Nov 2018 15:57:07 -0800, robert rose wrote:
> I just ran with native cmake 3.12.1.
> Everything worked and yes I did build grpc.
> I am using Fedora 29 and everything is up to date.
> After the make fails, do make V=1 and send me the output.  I will try and
> help you debug it.

So in fact, I was wrong: I told you the CMake version that my Fedora 29
system uses, but on this system, it builds fine. The build failure
occurred on an older Ubuntu system, which has:

$ cmake --version
cmake version 3.5.1

The full build log is at:

  http://code.bulix.org/h552dy-513207

And the host-grpc build with make V=1 is at:

  http://code.bulix.org/qy4r3g-513210

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
