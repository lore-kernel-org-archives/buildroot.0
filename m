From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Mar 2012 14:50:43 +0100
Subject: [Buildroot] [PATCH] bifferboard: new board
In-Reply-To: <4F5D5017.2080908@yahoo.co.uk>
References: <201203031529.36487.arnout@mind.be>
 <1330788921-27127-1-git-send-email-arnout@mind.be>
 <4F5D5017.2080908@yahoo.co.uk>
Message-ID: <201203181450.44385.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 12 March 2012 02:23:35 bifferos wrote:
> Write protecting the kernel text: 1048k
> Write protecting the kernel read-only data: 164k
> init[1]: segfault at 0 ip   (null) sp bf95bf40 error 4 in 
> busybox[8048000+7c000]

 Since this segmentation fault is in init, it will be tough to debug.
Judging from the address, it in fact happens even before init is 
started.  Is it possible that there isn't enough RAM to run busybox?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
