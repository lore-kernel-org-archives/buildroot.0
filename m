From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Mar 2012 13:46:42 +0100
Subject: [Buildroot] [RFC v2 00/31] Automatically produce legal
	compliance info
In-Reply-To: <4F5883B8.7050107@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <201203072241.00945.yann.morin.1998@free.fr>
 <4F5883B8.7050107@lucaceresoli.net>
Message-ID: <201203101346.42524.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 08 March 2012 11:02:32 Luca Ceresoli wrote:
> > And what about the linux, uClibc and busybox .config files? Unless I missed
> > something in your email, you did not address these...
> 
> I considered they are part of Buildroot, so they are kind of addressed... by
> the warning that says you have to tar your Buildroot on your own.
> 
> These may be added of course, but then we might ask ourselves if we should
> also save the post-built script, custom skeleton, additional device table
> files, whatever else... This would be hard to maintain.

 Ideally, all of them should be saved.  But I agree that it's not so 
simple.  So it can be left out for the moment.

 However, I'd warn about it, just like for the buildroot sources.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
