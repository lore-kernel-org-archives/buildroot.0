From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 May 2010 23:44:21 +0200
Subject: [Buildroot] [pull request] Pull request for branch build-fixes
In-Reply-To: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20100510234421.5ac0d4ce@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  9 May 2010 23:26:34 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Here is a set of random fixes for various build failures encountered
> while using randpackageconfig in my controlled/limited chroot test
> environment.

I've updated this branch at :

 git://git.busybox.net/~tpetazzoni/git/buildroot build-fixes

with two changes :

 * Add a reason for which VLC is marked broken

 * Add a dependency on !BR2_KERNEL_none for BR2_PACKAGE_DIRECTFB_MULTI

If you want me to resend a full pull request, don't hesitate to ask.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
