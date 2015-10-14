From: Pieter Smith <pieter@boesman.nl>
Date: Wed, 14 Oct 2015 18:43:59 +0200
Subject: [Buildroot] Supporting a second Barebox build to build the MLO/SPL
Message-ID: <20151014164359.GA10633@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I picked up the following from the Todo list:
> Allow a second Barebox build, to build the MLO/SPL. See
> http://patchwork.ozlabs.org/patch/207942/ and
> http://patchwork.ozlabs.org/patch/207943/. The proposed design is to have
> boot/barebox/ containing the common stuff, and then two separate packages
> boot/barebox-first/ and boot/barebox-second/ (names to be chosen). There is
> only one version selection, but each package allows to define the configuration
> to be used. Design should be a little bit like package/gcc, where we have
> multiple gcc builds, but share a lot of common definitions between the
> packages.

The wiki has been updated. I was not able to find a bug on bugzilla. I will be
using the same strategy as package/gcc. Any suggestions or input is welcome.

- Pieter Smith
