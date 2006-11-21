From: MikeW <mw_phil@yahoo.co.uk>
Date: Tue, 21 Nov 2006 19:05:31 +0000 (UTC)
Subject: [Buildroot] Using external toolchain for Buildroot ?
Message-ID: <loom.20061121T195143-393@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is there a way to use an external GNU toolchain for buiding the
Buildroot packages ?

I would like to build some libraries under Buildroot to work with
objects compiled with the external toolchain, however, I'm getting
the "EABI version mismatch" problem, which I currently haven't solved.

(Buildroot is creating libraries with EABI version = 0,
the other toolchain creates EABI version = 4;
this is probably related to my not yet finding an acceptable value for
"Build options: GNU target suffix" containing "-eabi")

Hence, one temporary shortcut would be to allow Buildroot to use
the other toolchain to build all the packages, instead of the one
it would build itself.

Is there any way in which I can do this, short of deleting all the
Buildroot-built tool binaries etc. and symlinking to the external toolchain,
which probably wouldn't work anyhow !!

Regards,

MikeW
