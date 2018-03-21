From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 21 Mar 2018 09:44:27 -0400
Subject: [Buildroot] [PATCH v5 0/5] gobject-introspection: new series
In-Reply-To: <CANQCQpbBdXSSmZ-9HEbFP7FHj4N=J1+W5wwEFyuGDy9ZtjE_vQ@mail.gmail.com>
References: <20180318190131.21404-1-aduskett@gmail.com>
 <CANQCQpbBdXSSmZ-9HEbFP7FHj4N=J1+W5wwEFyuGDy9ZtjE_vQ@mail.gmail.com>
Message-ID: <CAFSsvmpiQ27_m6GSywideXTXWkWAQy5ZkKxt=SGbLdQ06G-XJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew;

First off; I want to personally say thank you again for taking the
time to review this huge patch.

On Tue, Mar 20, 2018 at 12:12 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Adam,
>
> On Sun, Mar 18, 2018 at 2:01 PM, Adam Duskett <aduskett@gmail.com> wrote:
>>
>> For official submission to mainline Buildroot:
>>
>> This new series has the following upgrades:
>>   - It now works on all architectures supported by qemu-host.
>>   - Gstreamer1 can now compile gir files properly. (for real this time).
>>   - General makefile cleanups.
>>   - New patches that make cross-compiling a bit nicer (thanks, yocto!)
>
> Suggest updating those patches to all have links to upstream
> submissions as the string provided with the "Upstream: " comment in
> the description of the patch.
>
Can do! I found went and hunted them down.

>>   - Removed a patch that was yocto specific and not needed with buildroot.
>>   - Added a PKG_GIR_EXTRA_LIBS variable in pkg-autotools.mk
>
> Should the pkg-autotools.mk changes for this option, be a separate
> patch added before the others that use it?
>
> Matt
I can live with that.
