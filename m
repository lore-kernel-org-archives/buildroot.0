From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Dec 2010 16:40:06 -0300
Subject: [Buildroot] [PATCH 0/5] toolchain rework, part 1
Message-ID: <1291664411-27836-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the first batch of patches for the internal toolchain rework.

In this first stage we convert gmp, mpfr and mpc to proper packages and
hook them up for use in the current toolchain.

We also fix a small bug in the package infra with regards to versioned patches
that'll be required to avoid duplication in the binutils/gcc migration.
