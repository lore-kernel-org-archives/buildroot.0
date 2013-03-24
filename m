From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 10:49:04 +0100
Subject: [Buildroot] X.org bump to 7.7
Message-ID: <20130324104904.2e980f14@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

I think you can pull the x11r77_v2 branch from
https://bitbucket.org/baekdahl/buildroot. Notice that this is a
slightly more recent version than the one posted on the list, so you
shouldn't use patchwork to apply it. Considering the number of patches,
I think pulling Jesper's branch is the easiest solution.

I've build-tested this branch in two situations:

 * ARM Buildroot toolchain, as minimal as possible: only WCHAR enabled,
   which is the only mandatory requirement for X.org. Did a Kdrive
   build of X.org, after enabling a bunch of random X applications.

 * PowerPC glibc external toolchain. Did a Modular X.org build, after
   enabling a bunch of random X.org drivers and X.org applications.

Both builds went fine, so I think we should pull this X.org bump.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
