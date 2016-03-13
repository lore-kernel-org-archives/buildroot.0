From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Mar 2016 13:08:15 +0100
Subject: [Buildroot] Autobuilder update
In-Reply-To: <20160312225838.GL3745@free.fr>
References: <20160310234742.3df6dff2@free-electrons.com>
 <20160312225838.GL3745@free.fr>
Message-ID: <20160313130815.002d7f15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Mar 2016 23:58:38 +0100, Yann E. MORIN wrote:

> > Some autobuilder updates:
> > 
> >  - All the Buildroot pre-built external toolchains have been rebuilt
> >    with Buildroot 2016.02 + a few patches. To see which patches I'm
> >    using to build those external toolchains, see the branch at:
> > 
> >    http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=br-ext-toolchain-fixes
> > 
> >  - The br-sh4-full configuration has been changed to actually use the
> >    Buildroot toolchain, and not the pre-built Musl-cross toolchain.
> > 
> >  - I've fixed the Free Electrons build server, which was no longer
> >    building anything since quite some time, due to a lack of disk
> >    space. This will help re-increase the number of builds done each day.
> 
> I updated my instance yesterday evening. Thanks! :-)

In fact, updating your instance was not needed. The changes I made only
affect the .config files, which are re-downloaded every time a build
starts. So updating the autobuild-run script is not needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
