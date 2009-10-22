From: Anders Darander <anders.darander@gmail.com>
Date: Thu, 22 Oct 2009 11:47:52 +0200
Subject: [Buildroot] [RFC; PATCH] Use gdbserver from external toolchain
Message-ID: <2c9a759f0910220247u18c004epcb564aa65aa02d2b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've attached a patch (formatted by git), which adds the possibility
to have buildroot install the already compiled gdbserver from an
external toolchain.

To  make sure that debuging works, it is preferred if both the host
crosscompiler gdb and gdbserver is built from the same gdb version. If
we take the gdbserver from the external toolchain, this is guaranteed.

I'm not sure that the implementation is the best, it migth be  a
little bit "hackish". Looking forward to some comments for
improvement.

Regards,
Anders
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Use-gdbserver-from-external-toolchain.patch
Type: application/octet-stream
Size: 1781 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091022/ce01c088/attachment.obj>
