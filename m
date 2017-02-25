From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Feb 2017 18:45:01 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-24
In-Reply-To: <20170225154539.GE3627@free.fr>
References: <20170225072908.E590E20E2C@mail.free-electrons.com>
 <20170225104929.GC3627@free.fr> <20170225125211.GD3627@free.fr>
 <20170225154539.GE3627@free.fr>
Message-ID: <20170225184501.4b5a21a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Feb 2017 16:45:39 +0100, Yann E. MORIN wrote:

> So far, I have identified three packages that suffer from the problem:
> 
>   - libcec
>     http://autobuild.buildroot.org/results/3f3/3f3593bab7734dd274faf5b5690895e9424cbb89/
> 
>   - freerdp
>     http://autobuild.buildroot.org/results/5d4/5d429d0e288754a541ee5d8be515454c5fccd28b/
> 
>   - domoticz
>     http://autobuild.buildroot.org/results/fd0/fd0ba54c7abf973691b39a0ca1bb4e07d749593a/
> 
> (only one failure listed per package, there are many more...)
> 
> What do we do about that cmake bump?

I am fine with reverting the bump of CMake, of course hoping that it
will not introduce other regressions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
