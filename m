From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 May 2017 10:24:47 -0700
Subject: [Buildroot] IASL Support in BuildRoot?
Message-ID: <CAKmqyKOOgf2kKSAag=uLUzQX+Qkjom9ZyXQPHhdCuBG3t7XxuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+ BuildRoot mailing list
Change the subject, was: [autobuild.buildroot.net] Your build results
for 2017-05-01

This is failing because the host doesn't have iasl (from the
acpi-tools package).

I looked at BuildRoot and it supports building this for the target,
but no host support. What is the usual process here? Do we add it as a
host requirement or do we add support to build it?

Thanks,

Alistair

>
> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Monday, 1 May 2017 11:28 PM
> To: Alistair Francis <alistai@xilinx.com>
> Subject: [autobuild.buildroot.net] Your build results for 2017-05-0
>
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2017-05-01, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Build failures related to your packages:
>
>      aarch64 |                      xen-4.8.1 |
> http://autobuild.buildroot.net/results/afa199864d6b546fe759bb582a9c10702ea7fa
> 78
>
> --
> http://autobuild.buildroot.net
