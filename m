From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 08:46:44 +0100
Subject: [Buildroot] [PATCH 1/4] Add CMAKETARGETS infrastructure for
 CMake packages
In-Reply-To: <AANLkTi=frxyYAzAaApiwAfxairhSKe38qkBgvk633_eF@mail.gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-2-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTinkazQ2EzvCE46nSYmAkGiEJ3Ti+oM6=7g+u0Y5@mail.gmail.com>
	<AANLkTi=tmgB5T23WvH112P1YgrO-w+xjwtiU9=D01J90@mail.gmail.com>
	<AANLkTi=frxyYAzAaApiwAfxairhSKe38qkBgvk633_eF@mail.gmail.com>
Message-ID: <20101223084644.018fa724@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Dec 2010 22:34:17 +0100
Samuel Martin <s.martin49@gmail.com> wrote:

> srctree:
>   output/build/cdrkit-1.1.10
> buildtree:
>   output/build/cdrkit-1.1.10/build
> Like this, we keep only one directory per package and don't mess up the
> source tree.
> Whatever, both solutions are good. For me, it's not a big deal, but maybe BR
> leaders will prefer one or the other solution to keep it consistent.

I agree.

> > but give CMake CFLAGS/CXXFLAGS on the commandline when building internal
> > packages?
> 
> If we need, yes, but i am quite doubtful about the usefulness of these
> flags.

Huh ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
