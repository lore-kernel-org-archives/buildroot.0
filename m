From: Reinier Coetzer <reinier.coetzer@gmail.com>
Date: Wed, 2 Apr 2008 16:41:39 +0200
Subject: [Buildroot] Segmentation error with OpenSSH
Message-ID: <823018ed0804020741y55c7cb93k97f1aa75ee97a6dc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I used buildroot to compile a root filesystem and selected openssh
from menuconfig.
The system boots up fine, until it wants to generate a RSA and DSA
key, where it
receives a segmentation fault. Also when you run 'ssh' from the command line it
gives a segmentation fault.

What can the problem be here? Do I need to select additional packages
for it to work?
If so what additional packages?

Regards
  Reinier
