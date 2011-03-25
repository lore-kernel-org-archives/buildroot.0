From: Gerhard Heift <ml-buildroot-20110324-cba5@gheift.de>
Date: Fri, 25 Mar 2011 09:54:08 +0100
Subject: [Buildroot] removed first argument from *TARGETS
Message-ID: <20110325085407.GA5760@gheift>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I invested a little bit of time to understand the Makesystem of
buildroot. After this I rewrote it a little bit to purge the first
argument from the GENTARGETS, AUTOTARGETS and CMAKETARGETS macros.
I also added a variable $(PKG_DIR) which points to the package
directory, which is in some packages used to copy extra files to the
target.
([1], [2], [3], doc: [4])

After this I reordered all packages into categories, to cleanup the
package directory. [5]

Beside there is a little patch, which fixes a link in the documentation:
[6]

I hope, you can use some of the work I have done.

Regards,
  Gerhard

[1] https://github.com/gheift/buildroot/commit/a423ae05caa41b28a03cbc3d0f104c7154e0c608
[2] https://github.com/gheift/buildroot/commit/092381ecb395bf609e2f1e58d61b6ce6d4fcd953
[3] https://github.com/gheift/buildroot/commit/1c4c3233c8d202d06a6a293a854f9264526e8bd1
[4] https://github.coo/gheift/buildroot/commit/ce4726143199cc3bef1d3ac3ab1b34b468d7a0c5
[5] https://github.com/gheift/buildroot/tree/mail-2011-03-25-1
[6] https://github.com/gheift/buildroot/commit/bf4c02f6dace48cb7b98a41c8fc322f041fe1beb
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110325/fc427531/attachment.asc>
