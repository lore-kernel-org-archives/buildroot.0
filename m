From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 13 Mar 2012 18:34:36 +0100
Subject: [Buildroot] Fwd: Re: [PATCH 4/5] Microblaze: build kernel with
 device tree
Message-ID: <4F5F852C.1060903@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, hit the wrong button;-(

Am 12.03.2012 23:10, schrieb Thomas Petazzoni:
> Hello,
>
> Le Sun, 11 Mar 2012 17:50:17 +0100,
> Stephan Hoffmann <sho@relinux.de> a ?crit :
>
>> Device Tree and SimpleImage will be handled in buildroot in the
>> future. Until then, this patch is needed.
>>
>> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> I am not yet familiar with how the device tree blob is generated, but I
> don't like the fact that this patch is Microblaze specific. Other
Hello,

There is a discussion here on the list regarding this. I submitted this
patch
only to be able to build the whole system until DTS support is ready. It
is not meant
to go into the main tree.

Kind regards

Stephan


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de




-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
