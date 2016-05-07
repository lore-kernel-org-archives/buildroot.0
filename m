From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sat, 7 May 2016 09:32:46 +0200
Subject: [Buildroot] Which package for bluetooth management?
In-Reply-To: <20160505142533.67f8e473@free-electrons.com>
References: <572A61D4.10905@gmail.com>
 <7132491b-5080-2001-1717-250d698244e9@mind.be> <572AEB2E.1050305@gmail.com>
 <572AFC1F.3070004@gmail.com> <20160505142533.67f8e473@free-electrons.com>
Message-ID: <572D9A1E.20609@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 05/05/2016 14:25, Thomas Petazzoni ha scritto:
>> - bluez4 is recommended with pulseaudio due to simpler configuration of
>> A2DP and HFP
>> - but connman 1.32 doesn't support bluez4 anymore
>> - but QtConnectivity doesn't support bluez5
> I think it does, see https://patchwork.ozlabs.org/patch/612073/.


I've just seen bluez5 requires glibc or musl toolchain.
I tried to rebuild all with glibc (instead of uClibc) but the RPi3 
refuses to boot due to a kernel panic.

It's a known behavior? Otherwise I'm afraid I have to do a "regression" 
with older versions.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel-panic.jpg
Type: image/jpeg
Size: 137771 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160507/a8f32b0d/attachment-0001.jpg>
