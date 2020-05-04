From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 4 May 2020 17:04:53 -0400
Subject: [Buildroot] .br2-external files
Message-ID: <CANxTyt45hu0Apyctnoc9a5n25FTwFrddcNta0u-9e7Tw4AjLnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I noticed that the
https://buildroot.org/downloads/buildroot-2020.02.1.tar.bz2 has these
files in it:

$ ls -1 .br2*

.br2-external.in.jpeg

.br2-external.in.menus

.br2-external.in.openssl

.br2-external.in.paths

.br2-external.in.toolchains

.br2-external.mk


But when I look at the 2020.02.x tag in git, those files are not there.

These are derived files, yes?  Are they expected to be in the release tarball?

TIA,
Danomi -
