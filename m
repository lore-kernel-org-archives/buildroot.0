From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 6 Nov 2017 09:41:23 -0600
Subject: [Buildroot] [PATCH 1/1] package/dtc: qemu system build need
 libfdt.
In-Reply-To: <d6dd36db-bf3f-217e-cf1f-978c9c0ebf16@mind.be>
References: <1509624873-16240-1-git-send-email-ren_guo@c-sky.com>
 <09523a7a-0125-4c10-bb29-e15cfa00165f@cesnet.cz>
 <cecbedfb-98a5-4b52-a59b-3129c7e0da51@cesnet.cz>
 <d6dd36db-bf3f-217e-cf1f-978c9c0ebf16@mind.be>
Message-ID: <CANQCQpb7ZUUxiC9Br8NtGb863+PEhtJ5-JJ9bGXT7rBBxpusRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan/Arnout,

On Sat, Nov 4, 2017 at 3:51 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 03-11-17 03:33, Jan Kundr?t wrote:
>> ...and here's a simple patch against U-Boot which fixes the build for me.
>
>  Isn't the build already fixed if you only replace the ../include line? The
> ../lib/libfdt/fdt.h should not be problematic since that file doesn't exist in
> STAGING_DIR. Right? Same for libfdt_internal.h.
>

I've got a number of internal CI failures from this one.  I'm testing
the combined uboot-tools and uboot fix against my cases and will send
a patch later today.

Matt
