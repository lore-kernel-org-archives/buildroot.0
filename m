From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2008 17:10:35 +0200
Subject: [Buildroot] Kernel header installed with external toolchain ?
Message-ID: <20081022171035.451de23c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using Buildroot with an external toolchain, but after every cleanup
of the tree, the next 'make' will trigger the download of the kernel
source code and the installation of kernel headers. I'm wondering why
this is necessary, since the external toolchain already have the
headers.

Isn't this a bug of the external toolchain management ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
