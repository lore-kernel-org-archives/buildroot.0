From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Oct 2012 18:32:10 +0200
Subject: [Buildroot] Important fixes for autobuilder issues
Message-ID: <20121013183210.34aa681d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

(Resending with Buildroot list Cc'ed)

Could you quickly apply the following patches:

 * http://patchwork.ozlabs.org/patch/183305/

   This one fixes the linux-pam build failure reported at
   http://autobuild.buildroot.org/results/8a5a5c6f350666c8d3a0fd26878c0a21653e6a24/build-end.log
   and has been Acked by Arnout.

 * http://patchwork.ozlabs.org/patch/191292/

   It fixes the build failure at
   http://autobuild.buildroot.net/results/c279007dd8b89a1c6fc9b58d3c2cda01ab84279e/build-end.log

 * To fix the gpsd issue, apply either
   http://patchwork.ozlabs.org/patch/191291/ or
   http://patchwork.ozlabs.org/patch/191300/ or both.

I'm asking specifically to apply those ones quickly, because they are
really making the autobuild results horrible at the moment.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
