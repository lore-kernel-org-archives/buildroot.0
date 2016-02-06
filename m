From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 11:08:39 +0100
Subject: [Buildroot] [PATCH 0/3 v2] defconfigs: follow-up fix after
 headers-same-as-kernel option (branch yem/kernel-headers)
In-Reply-To: <cover.1454713324.git.yann.morin.1998@free.fr>
References: <cover.1454713324.git.yann.morin.1998@free.fr>
Message-ID: <20160206110839.21e4e5ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  6 Feb 2016 00:06:14 +0100, Yann E. MORIN wrote:

> Yann E. MORIN (3):
>       defconfigs: use the new headers-version-same-as-kernel-version option
>       linux: drop the option to use the same version as that of the headers
>       defconfigs: all use the headers from the kernel

All three patches applied. I've restarted a Travis CI build of all
defconfigs, so that we get the results without waiting for the normal
regular defconfig build.

The build is currently on-going at
https://travis-ci.org/buildroot/buildroot-defconfig-testing/builds/107419711.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
