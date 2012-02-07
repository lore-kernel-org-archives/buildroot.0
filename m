From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 8 Feb 2012 00:21:56 +0100
Subject: [Buildroot] kernel boot problem
In-Reply-To: <201202071829.28255.arnout@mind.be>
References: <7E2C5DAB2B124E0C900A527EE0EF019C@JohanW7>
 <CAAXf6LXL+1pkZTm56CUUkwmqkd0j9ozm6Yut8xhtGGC3qAVuHQ@mail.gmail.com>
 <201202071829.28255.arnout@mind.be>
Message-ID: <48571C8EA36D496C9CFF0E84D58C2D34@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi 

Ok, i used the same rootfs, so i the rootfs seems ok.(i did not recompile the rootfs, just used the kernel build in buildroot
2011.11)
This shows to me that the rootfs is ok.

If you saw my other post, i dound out when uning gcc 4.53 in buildroot 2011.11 the kernel fails to boot, but with gcc 4.3.6 in
buildroot 2011.11 no problem booting.
So i did a run against gcc 4.4.6  and this one is ok too.
Strange anyway..


-----Oorspronkelijk bericht-----
Van: Arnout Vandecappelle [mailto:arnout at mind.be] 
Verzonden: dinsdag 7 februari 2012 18:29
Aan: buildroot at busybox.net
CC: Thomas De Schampheleire; Sagaert Johan
Onderwerp: Re: [Buildroot] kernel boot problem

On Tuesday 07 February 2012 15:29:52 Thomas De Schampheleire wrote:
> Can you compare the versions of other packages used between both 
> buildroot versions?
> For example, busybox probably changed version. Can you try stepping back that ?

 Since the panic happens before init starts, busybox is the only package whose version is relevant...

 However, the /init thing was added to the skeleton since 2010.02; that may make a difference.  Johan, do you have /init on your
target?  Is it different between the two versions?

 Regards,
 Arnout




-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
