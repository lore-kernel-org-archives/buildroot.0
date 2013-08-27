From: Jenkins, Lee (ISS Houston) <Lee.Jenkins@hp.com>
Date: Tue, 27 Aug 2013 22:38:23 +0000
Subject: [Buildroot] debugging inittab
In-Reply-To: <5216A076.5030409@mind.be>
References: <2DD0B9C711CDFC45A3A266C78966CE7F451F39A0@G4W3291.americas.hpqcorp.net>
 <5216A076.5030409@mind.be>
Message-ID: <2DD0B9C711CDFC45A3A266C78966CE7F451F8F81@G4W3291.americas.hpqcorp.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----Original Message-----
From: Arnout Vandecappelle [mailto:arnout at mind.be] 
Sent: Thursday, August 22, 2013 6:36 PM
To: Jenkins, Lee (ISS Houston)
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] debugging inittab
Importance: Low

> On 22/08/13 22:11, Jenkins, Lee (ISS Houston) wrote:
> > Hello. I am debugging a boot problem for a few hours. I'm clearly in 
> > over my head and I could use some insight.
> >
> > For debugging purposes, I am booting from a kernel and rootfs on an 
> > nfs share of my dev machine. The console is ttyS0.
>
>   The nfs-share is an extracted output/images/rootfs.tar, right? You're not using the target directory?
>

That was the problem. Thanks!
