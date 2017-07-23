From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 23 Jul 2017 07:19:35 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-07-22
In-Reply-To: <20170723063052.1CB8521DBF@mail.free-electrons.com>
References: <20170723063052.1CB8521DBF@mail.free-electrons.com>
Message-ID: <CANQCQpa0--xE+_YtXVqfJr78i==sY0gj3fECTBKm7g-eByd9=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Jul 23, 2017 at 1:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>

[snip]

>       xtensa |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/a09a4449beae2f78ea47585f4dfeb0b8b8b9853e |
>  powerpc64le |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/d853a1eb3d03b63825331dc899a61356dfae1a33 |
>     mips64el |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/1b98300088335056d9c409070bcc87435a42eeef |

Fixed by: https://patchwork.ozlabs.org/patch/792520/

[snip]

>     mips64el |                 paxtest-0.9.15 | NOK | http://autobuild.buildroot.net/results/450c5388aa26d81eccb462014bee520b6e42b06b |
>     mips64el |                 paxtest-0.9.15 | NOK | http://autobuild.buildroot.net/results/635a988e61f5820ad8fd94bda0615b9436e6ae83 |

I'll take a look at this one.

Matt
