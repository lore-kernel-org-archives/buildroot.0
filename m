From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 17:48:03 +0100
Subject: [Buildroot] [PATCH v2 5/7] package/freescale-imx/imx-gpu-viv:
 bump to version 6.4.0.p1.0
In-Reply-To: <CADCpmyPFFQO+0m3gK_825QHAMN18SeCOSLFFnyzswniZt5qN3Q@mail.gmail.com>
References: <20200203193155.12657-1-tuzakli.refik@gmail.com>
 <20200203193155.12657-5-tuzakli.refik@gmail.com>
 <20200204231052.350677e5@windsurf>
 <CADCpmyPFFQO+0m3gK_825QHAMN18SeCOSLFFnyzswniZt5qN3Q@mail.gmail.com>
Message-ID: <20200205174803.143caa52@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Feb 2020 16:54:15 +0100
Gary Bisson <bisson.gary@gmail.com> wrote:

> I'm on vacation this week without any laptop around so my answer will most
> likely be inaccurate.

Thanks, enjoy your vacations! :-)

> But I'll try off the top of my head:
> - the main goal was to copy the yocto recipe for the build cmds, the links
> commands should match more or less
> - but openGL was indeed never properly supported anyway since it required
> to build mesa3d but overwrite the libGL library at the end (what was done
> by yocto at the time) which wasn't supported in BR

Argh. Horrible. Why do they do that ?

> - the only person I know who added some kind of openGL support in Buildroot
> is you ;) (I recall a "imx-fix" branch in FE git server)

Me Thomas, or Refik ? I might have submitted some OpenGL changes a
while ago, but I'm certainly not the only one.

Well, OK, if we want full OpenGL support with imx-gpu-viv, some more
work is needed I believe, including actual testing on the target.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
