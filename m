From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 16 Jan 2012 00:50:52 -0500
Subject: [Buildroot] pci_ids.h missing
In-Reply-To: <CAOrAeokiOHCwrwG7VGbAem=w4-Gx-P8QjuqQYK_y3=S278S=xg@mail.gmail.com>
References: <CAOrAeokiOHCwrwG7VGbAem=w4-Gx-P8QjuqQYK_y3=S278S=xg@mail.gmail.com>
Message-ID: <201201160050.53285.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 15 January 2012 14:24:41 vbr vbr wrote:
> pci_ids.h is missing from the include/linux directory in the staging area:
> 
> # ls output/staging/usr/include/linux/pci*.h
> output/staging/usr/include/linux/pci.h
> output/staging/usr/include/linux/pci_regs.h
> 
> Am I missing something in the buildroot configuration?

upstream linux kernel doesn't ship it, thus buildroot does not
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120116/570ca36d/attachment.asc>
