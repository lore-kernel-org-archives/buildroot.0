From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 24 Oct 2013 16:09:08 -0500
Subject: [Buildroot] uboot host tools 2013.10 mkimage does not exist
In-Reply-To: <A96AA0A8EE3542B9971D20A3266209BA@JohanW7>
References: <A96AA0A8EE3542B9971D20A3266209BA@JohanW7>
Message-ID: <OF4A13E92C.01E15163-ON86257C0E.0073C87E-86257C0E.00742BE8@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert,

"Sagaert Johan" <sagaert.johan@skynet.be> wrote on 10/24/2013 03:58:01 PM:

> Hi
> 
> make[1]: Leaving directory `/home/buildroot12git'
> >>> host-uboot-tools 2013.10 Installing to host directory
> /usr/bin/install -m 0755 -D 
/home/buildroot12git/output/build/host-uboot-tools-2013.10/tools/mkimage
> /home/buildroot12git/output/host/usr/bin/mkimage
> /usr/bin/install: cannot stat 
`/home/buildroot12git/output/build/host-uboot-tools-2013.10/tools/mkimage': 
No such file or directory
> 
> If i look into the host-uboot build dir , i find no mkimage.
> Maybe it needs te be explicit enabled ?

Please see Gustavo Zacarias patch to fix this issue:

http://patchwork.ozlabs.org/patch/285999/

Also see an email that I sent early today explaining the issue related to
u-boot.

http://lists.busybox.net/pipermail/buildroot/2013-October/081076.html

In the interim, you could revert the commit mentioned in the email
that I linked to above. 

Thanks,
-Ryan
