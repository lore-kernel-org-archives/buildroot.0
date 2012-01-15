From: vbr vbr <vvvg77@gmail.com>
Date: Sun, 15 Jan 2012 11:24:41 -0800
Subject: [Buildroot] pci_ids.h missing
Message-ID: <CAOrAeokiOHCwrwG7VGbAem=w4-Gx-P8QjuqQYK_y3=S278S=xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

pci_ids.h is missing from the include/linux directory in the staging area:

# ls output/staging/usr/include/linux/pci*.h
output/staging/usr/include/linux/pci.h
output/staging/usr/include/linux/pci_regs.h

Am I missing something in the buildroot configuration?

Thanks
Vincent
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120115/531426f1/attachment.html>
