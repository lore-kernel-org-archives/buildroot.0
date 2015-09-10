From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 10 Sep 2015 10:08:22 +0200
Subject: [Buildroot] [PATCH 02/14] kobs-ng: remove obsolete package
In-Reply-To: <20150910035554.GM2191@tarshish>
References: <1441830063-8190-1-git-send-email-gary.bisson@boundarydevices.com>
 <1441830063-8190-3-git-send-email-gary.bisson@boundarydevices.com>
 <20150910035554.GM2191@tarshish>
Message-ID: <CAAMH-yu+wGVBuDPDb3UVf=_NKT+f16R6mAEqzW4EeLDNroPUsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Thu, Sep 10, 2015 at 5:55 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Gary,
>
> On Wed, Sep 09, 2015 at 10:20:51PM +0200, Gary Bisson wrote:
>> -config BR2_PACKAGE_KOBS_NG
>> -     bool "kobs-ng"
>> -     depends on BR2_arm
>> -     help
>> -       The kobs-ng tool is used for writing images to NAND on i.MX
>> -       platforms.
>> -
>> -       This utility is provided by Freescale as-is and doesn't have an
>> -       upstream.
>
> Please add a Config.in.legacy entry for BR2_PACKAGE_KOBS_NG that selects
> BR2_PACKAGE_IMX_KOBS. For the sake of bisectability the patch adding imx-kobs
> should come before this one.

Good catch! I always forget about Config.in.legacy. Will do it in v2
which might happen tomorrow.

Thanks,
Gary
