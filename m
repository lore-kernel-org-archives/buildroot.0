From: Rory Slegtenhorst <rory.slegtenhorst@gmail.com>
Date: Wed, 17 Jan 2007 21:15:32 +0100
Subject: [Buildroot] Make buildroot use another kernel...
Message-ID: <5e15b0e10701171215sf45c5f7rd1ce3c9286a01fe6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I hope this question isn't too lame ;)

I have the kernel I need, patched/configured/compiled living in
/usr/usr/linux-blah...
How can I make buildroot use that kernel tree instead to build my kernel?

The reason I ask is because I noticed buildroot now installes another
kernel+libs in my rootfs... But I had already modified buildroot so it
would use another rootfs source tree which includes my own kernel and
libs. *grin*

Thanks,
-- 
Rory Slegtenhorst
rory dot slegtenhorst at gmail dot com
