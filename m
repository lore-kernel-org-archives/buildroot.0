From: Patrick Doyle <wpdster@gmail.com>
Date: Fri, 26 Feb 2016 10:03:10 -0500
Subject: [Buildroot] Is it possible to override a package version from
	BR2_EXTERNAL?
Message-ID: <CAF_dkJDcBuOOe3Z5zGfS=eA8tJ9k54DqRahGuZeR8vGE1T+FBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am asking because it appears (for the moment) that the 2016.01
host-uboot-tools mkenvimage utility does not generate an environment
file compatible with my non-2016.01 u-boot.

I will try changing UBOOT_TOOLS_VERSION to 2015.01 in uboot-tools.mk,
but that is not a long term solution -- I would rather use a pristine
buildroot source tree with by BR2_EXTERNAL customizations for kernel
_defconfig files & the like.

Or, it's possible that something else entirely is wrong with my
environment file and it has nothing to do with mkenvimage.  But I am
still curious about overriding specific package revisions on a
case-by-case basis.

--wpd
