From: Kantanu Kumar Mohapatra <kantanukumar@gmail.com>
Date: Tue, 30 Sep 2014 00:13:49 +0530
Subject: [Buildroot] Using u-boot tools
In-Reply-To: <20140929183824.5b7bc3e5@free-electrons.com>
References: <CAJO1S91Kw0tsM-Azy7s9aVBaFORpB2Gp0-qrST2rDavorQUGjA@mail.gmail.com>
 <20140929111853.6881f323@free-electrons.com>
 <CAAXf6LXTaWD=4KrL3oF3Sy4dP+cFbX5fBK3LD7WACtRvuhxmqw@mail.gmail.com>
 <20140929152136.4d7cee9c@free-electrons.com>
 <CAJO1S935TBt+HHGQ43WH9fzG0s9oOEk0hfsi-OXrr83Td_umQg@mail.gmail.com>
 <20140929183824.5b7bc3e5@free-electrons.com>
Message-ID: <CAJO1S92HBmxKivtoqZDEjGYt5e6xiQkrHnCPLi1H0O4E9xtixg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many thanks.

Yaa I too found it as the place to take the source. The thing is, uboot
tools is under auto-target. That's I am not much familiar with, how to make
changes to that to take the source?

I'll be thankful if you could help me to make changes to that makefile.

Thanks,
Kantanu
On 29-Sep-2014 10:08 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Kantanu Kumar Mohapatra,
>
> On Mon, 29 Sep 2014 21:29:40 +0530, Kantanu Kumar Mohapatra wrote:
>
> > ?Frankly Speaking, I want to build fw_printenv in uboot-2010.03(for
> > buildroot-20104.03), in uboot-2010.03 way. Is it possible??
>
> Yes, in this case, just edit uboot-tools.mk and adapt it to take
> sources from U-Boot 2010.03.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140930/65c16369/attachment.html>
