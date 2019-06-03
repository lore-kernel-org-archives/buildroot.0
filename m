From: Ryan Whelan <rcwhelan@gmail.com>
Date: Mon, 3 Jun 2019 16:16:10 -0400
Subject: [Buildroot] error with `make uclibc-menuconfig`
Message-ID: <CAM3m09S7iwrJ5KQAXwzG41LKYkvzKJ2bOwpgCEno3_v1hkwbVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When running `make uclibc-menuconfig`, (2019-02-2) with my configuration
file for buildroot (attached), I get the following error.

Applying 0002-xtensa-add-custom-bits-poll.h.patch using patch:
patching file libc/sysdeps/linux/xtensa/bits/poll.h
for f in uclibc-config ; do if [ ! -f "${f}" ]; then printf "Kconfig
fragment '%s' for '%s' does not exist\n" "${f}" "uclibc"; exit 1; fi; done
Kconfig fragment 'uclibc-config' for 'uclibc' does not exist
make: *** [package/uclibc/uclibc.mk:458: uclibc-config] Error 1

I'm not quite sure how to diagnosis the issue any further.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190603/a9eaf84e/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-config
Type: application/octet-stream
Size: 103362 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190603/a9eaf84e/attachment.obj>
