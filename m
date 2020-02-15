From: Wesley Chow <wes@cortico.ai>
Date: Sat, 15 Feb 2020 10:12:12 -0500
Subject: [Buildroot] multiple kernel build?
Message-ID: <CAG=Azd9yPUL0hrMnL9xf9J69uwwv4GUqCmMK5RciZDexzSDsiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm having trouble figuring out if buildroot had a mechanism for building
multiple Linux kernels within one image. For example, if I would like to
provide one image for different Raspberry Pi versions or QEMU, I would need
to distribute kernels for different CPU archs (setting aside the problem of
detecting which hardware I'm on in the bootloader). Is this currently
possible?

Thanks,
Wes
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200215/bb0dafed/attachment.html>
