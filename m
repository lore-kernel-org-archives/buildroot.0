From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Feb 2014 18:30:11 +0100
Subject: [Buildroot] Antw: Re: Antw: Re: How to get the kernel to mount
 a rootfs without an initramfs ??
In-Reply-To: <1102199395.5272670.1392112422985.JavaMail.root@openwide.fr>
References: <1102199395.5272670.1392112422985.JavaMail.root@openwide.fr>
Message-ID: <52FA5E23.3090109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/14 10:53, Jeremy Rosen wrote:
>>
>> the kernel panic message is the following:
>>
>> VFS: Cannot open root device "mmcblk0" or unknow-block(0,0) Please
>> append a correct "root=" boot option; here are the available
>> partitions: not syncing: VFS: Unable to mount root fs on
>> unknown-block(0,0)

 Actually this sounds like you have no mmc driver in your kernel.

 Regards,
 Arnout

>>
>> As far as I know I have never partitioned the SD at all, so I don't
>> think p1 is important then. Maybe it's easier if you can send me
>> your command line , so I know what's the "truth" and look up what
>> went wrong here
>>
> 
> 
> well, I don't understand where is your rootfs, then... do you have
> a single partition on the SD ? you do need to have a partition 
> table afaik, even for a single partition. 
> 
> Try to partition your SD card with a partition editor and then 
> adding the squashfs as the first partition
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
