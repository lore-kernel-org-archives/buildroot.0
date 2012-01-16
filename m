From: vbr vbr <vvvg77@gmail.com>
Date: Mon, 16 Jan 2012 09:32:06 -0800
Subject: [Buildroot] pci_ids.h missing
In-Reply-To: <CAOrAeomeuJhMTOicaqz22Y+xULo1hZBs92xASrWsSYCG8gvVdw@mail.gmail.com>
References: <CAOrAeokiOHCwrwG7VGbAem=w4-Gx-P8QjuqQYK_y3=S278S=xg@mail.gmail.com>
 <201201160050.53285.vapier@gentoo.org>
 <CAOrAeomeuJhMTOicaqz22Y+xULo1hZBs92xASrWsSYCG8gvVdw@mail.gmail.com>
Message-ID: <CAOrAeomOCJ4fmDVwcEy6LqqnfByyB5Npwe4bGhR4EKDJP9iCJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

oh I guess headers_install doesn't install that file for my target arch...

Vincent


On Mon, Jan 16, 2012 at 8:38 AM, vbr vbr <vvvg77@gmail.com> wrote:

> Just downloaded and extracted a vanilla 2.6.39.4 kernel from kernel.org,
> and this version does ship pci_ids.h. There must be something else going on:
>
> x linux-2.6.39.4/include/linux/pch_dma.h
> x linux-2.6.39.4/include/linux/pci-acpi.h
> x linux-2.6.39.4/include/linux/pci-aspm.h
> x linux-2.6.39.4/include/linux/pci-dma.h
> x linux-2.6.39.4/include/linux/pci.h
> x linux-2.6.39.4/include/linux/pci_hotplug.h
> x linux-2.6.39.4/include/linux/pci_ids.h   <<<<<<<<<<<<<
> x linux-2.6.39.4/include/linux/pci_regs.h
> x linux-2.6.39.4/include/linux/pcieport_if.h
>
> Thanks
> Vincent
>
>
>
> On Sun, Jan 15, 2012 at 9:50 PM, Mike Frysinger <vapier@gentoo.org> wrote:
>
>> On Sunday 15 January 2012 14:24:41 vbr vbr wrote:
>> > pci_ids.h is missing from the include/linux directory in the staging
>> area:
>> >
>> > # ls output/staging/usr/include/linux/pci*.h
>> > output/staging/usr/include/linux/pci.h
>> > output/staging/usr/include/linux/pci_regs.h
>> >
>> > Am I missing something in the buildroot configuration?
>>
>> upstream linux kernel doesn't ship it, thus buildroot does not
>> -mike
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120116/e7517c50/attachment.html>
