From: Adam Nielsen <a.nielsen@shikadi.net>
Date: Wed, 19 Jun 2013 20:11:09 +1000
Subject: [Buildroot] binutils doesn't like -elf2flt option
In-Reply-To: <20130619120616.447be089@skate>
References: <kphffs$v5g$1@ger.gmane.org> <51BEAB3A.8010408@mind.be>
 <kpmcpb$lbo$1@ger.gmane.org> <51C08403.4050900@mind.be>
 <kpqg93$v74$1@ger.gmane.org> <20130619082557.447efce8@skate>
 <kprol2$uk1$1@ger.gmane.org> <20130619102133.7570dcd4@skate>
 <kprv8d$6iq$1@ger.gmane.org> <20130619120616.447be089@skate>
Message-ID: <kps03n$e9p$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> $ python2 ../../../buildroot/support/scripts/graph-depends > dep.dot
>
> This one is correct.

Great, thanks!

>> Getting targets
>> Getting dependencies for ['elf2flt', 'ncurses', 'zlib', 'nano', 'busybox',
>> 'linux', 'rootfs-romfs', 'rootfs-tar', 'rootfs-cpio', 'rootfs-initramfs',
>> 'rootfs-squashfs']
>> Error getting dependencies ['elf2flt', 'ncurses', 'zlib', 'nano', 'busybox',
>> 'linux', 'rootfs-romfs', 'rootfs-tar', 'rootfs-cpio', 'rootfs-initramfs',
>> 'rootfs-squashfs']
>>
>> So I'm not sure whether I need to do something differently?
>
> What does the output PDF looks like?

I can't generate the PDF, the dep.dot file is zero bytes.  I'm guessing 
graph-depends gives up when it reports that error message.

Thanks,
Adam.
