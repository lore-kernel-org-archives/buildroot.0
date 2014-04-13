From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 13 Apr 2014 08:30:04 +0200
Subject: [Buildroot] lava-test package in buildroot
Message-ID: <CAAXf6LWYX6SSF7Td=t3oHEmjUgi6Y+DNpC-EpY6KZdn2LC8o=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ludovic, Yegor,

The buildroot patchwork still contains packages proposed by Ludovic:
lava-test, lava-tool, python-linaro-dashboard-bundle.

In one of the related mail threads, it was mentioned that lava-test
didn't properly work on target. I did not delve into the details of
this, but my question is: what shall we do about these patches?

In the mean time, a python-package infrastructure has been added in
buildroot, so if we want to integrate the patches they need to be
refreshed first.

Of course, we should only add packages that work...

Thanks,
Thomas
