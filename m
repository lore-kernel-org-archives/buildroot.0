From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 May 2020 11:52:18 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-05-15
In-Reply-To: <421a58a5-49b2-54fe-8331-f3f883961c9b@grinn-global.com>
References: <20200516062654.AB72987E37@fraxinus.osuosl.org>
 <421a58a5-49b2-54fe-8331-f3f883961c9b@grinn-global.com>
Message-ID: <20200516115218.4780a26c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 May 2020 11:20:26 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> /home/naourr/work/instance-1/output-1/build/cegui-0-8-7/cegui/src/falagard/XMLHandler.cpp:1926:1: fatal error: error writing to /tmp/ccuouM3W.s: No space left on device
>   } // End of  CEGUI namespace section
>   ^
> 
> it seems that the autobuilder needs more free space ;)

Yes, this has been fixed already.

Perhaps we need to detect this kind of issues, and discard the build
results when that happens.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
