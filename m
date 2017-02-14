From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 21:02:24 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <20170214163927.GA3624@free.fr>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
 <20170214163927.GA3624@free.fr>
Message-ID: <20170214210224.7fb5c2a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 17:39:27 +0100, Yann E. MORIN wrote:

> On 2017-02-14 14:27 +0100, Thomas Petazzoni spake thusly:
> > >          arm |             mesa3d-demos-8.3.0 | NOK | http://autobuild.buildroot.net/results/6f197c643972e92f0b27b3afac7da7b4b1115f7e  
> > 
> > BR2_PACKAGE_PROVIDES_LIBGL="mesa3d"
> > BR2_PACKAGE_PROVIDES_LIBEGL="rpi-userland"
> > BR2_PACKAGE_PROVIDES_LIBGLES="rpi-userland"
> > 
> > This seems like a quite messy configuration: we have mesa3d as the
> > OpenGL provider, and rpi-userland as the OpenGLES/EGL provider. Yann,
> > what do you think about this?  
> 
> I believe this case does not make sense. We should protect against that.

Indeed. The question is how :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
