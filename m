From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 3 Jan 2017 11:04:12 -0800
Subject: [Buildroot] [PATCH v2] package/xen: Update to version 4.8.0
In-Reply-To: <20161223092238.3a692c89@free-electrons.com>
References: <1482445317-9435-1-git-send-email-alistair.francis@xilinx.com>
 <20161222235936.018f7807@free-electrons.com>
 <CAKmqyKOMOCfa3+BAsdOuAOSy+acQnSTjQOcr9H2XxQbd1e9t4w@mail.gmail.com>
 <20161223092238.3a692c89@free-electrons.com>
Message-ID: <CAKmqyKM6kSfKJUhfXHXs9-2Rpw3k0HW0bF=Av2rMfX-XjJ3p5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 23, 2016 at 12:22 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 22 Dec 2016 17:09:42 -0800, Alistair Francis wrote:
>
>> I need to do that as well as unset the CFLAGS (I need to replace it
>> with APPEND_CFLAGS).
>>
>> If I did the same thing but stored it in a Xen specific variable would
>> that be ok?
>
> How did you "unset" the CFLAGS ?

I renamed the CFLAGS variable to APPEND_CLFAGS. That allowed me to
build Xen without the CFALGS errors that we have previously run into.

If I fix it up to only apply for Xen (instead of changing the global
variables) then that shouldn't affect any other packages then.

Thanks,

Alistair

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
