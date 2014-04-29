From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Apr 2014 00:01:15 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: new package
In-Reply-To: <535FDC9F.70805@zacarias.com.ar>
References: <1398790166-18900-1-git-send-email-gustavo@zacarias.com.ar>
 <20140429165618.GB3248@free.fr> <535FDC9F.70805@zacarias.com.ar>
Message-ID: <5360212B.20504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/14 19:08, Gustavo Zacarias wrote:
> On 04/29/2014 01:56 PM, Yann E. MORIN wrote:
> 
>> This should also "depends on BR2_USE_MMU".
> 
> Ooops, i'll add it up.
> 
>> Would it make sense to add them as host-tools, too?
> 
> Not really IMHO.
> Grub2 can in theory understand btrfs, but that would be realistically
> speaking a x86/amd64-only thing.
> And then btrfs-progs AFAIK doesn't include any tool to create images
> like genext2fs does, it talks directly with block devices.
> Sudo with loopback is a bit dangerous and off the charts i think.

 Still, it may be useful to add it as a Config.host option, for use in
post-image scripts (which may indeed have sudo).

 Regards,
 Arnout

> Regards.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
