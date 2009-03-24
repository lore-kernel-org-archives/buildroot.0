From: Per-Henrik Lundblom <ph@whatever.nu>
Date: Tue, 24 Mar 2009 14:53:02 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090324132946.GA23829@buzzloop.caiaq.de>
References: <20090318131349.GD27893@whatever.nu>
	<20090318132530.GF18723@buzzloop.caiaq.de>
	<20090318142514.GE27893@whatever.nu>
	<20090318144657.GC19956@buzzloop.caiaq.de>
	<20090318155323.GG27893@whatever.nu>
	<20090319083953.GE30293@buzzloop.caiaq.de>
	<20090324123710.GW27893@whatever.nu>
	<20090324131156.GA22599@buzzloop.caiaq.de>
	<20090324131904.GX27893@whatever.nu>
	<20090324132946.GA23829@buzzloop.caiaq.de>
Message-ID: <20090324135302.GY27893@whatever.nu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Daniel Mack <daniel@caiaq.de> [090324 14:29]:
 
> Please have a look at this thread:
> 
>   http://lists.arm.linux.org.uk/lurker/message/20090123.185306.b2c4bb05.en.html
> 
> Conclusion is: do not build your kernel using a compiler that generates
> iwmmxt code. As these extensions can't be used from both the kernel and
> userspace at the same time, it is reserved for user's binaries and hence
> forbidden in the kernel.

That makes sense... Shouldn't buildroot automagically just solve this
for me? ;)

In build_arm/staging_dir/usr/bin I only have arm-linux-uclibcgnueabi-*
gcc tools. I guess those is not the right ones to build the kernel then?

/PH

--
Per-Henrik Lundblom           epost: ph at whatever.nu
telefon: 0733-20 71 26        hemsida: www.whatever.nu
