From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Apr 2012 23:35:10 +0200
Subject: [Buildroot] [PATCH 1/4] package/multimedia: move networking
	libs out
In-Reply-To: <834c1b3a8e44b77b2fa173dba81e2ffc@zacarias.com.ar>
References: <1335370243-27044-1-git-send-email-gustavo@zacarias.com.ar>
 <20120425193839.3b45570b@skate>
 <834c1b3a8e44b77b2fa173dba81e2ffc@zacarias.com.ar>
Message-ID: <201204272335.10872.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 25 April 2012 19:45:46 Gustavo Zacarias wrote:
> > I am not quite sure about this one. Even though it's true libmpd or
> > live555 have networking capabilities, I think their core feature is
> > more audio and/or video oriented, so it should be in some
> > Libraries->Audio or Libraries->Audio/Video section rather than
> > Libraries->Networking.
> >
> > Thomas
> 
> live555 can handle RTSP which can stream video also so it isn't clear 
> cut.

 If I am looking for live555, I would be looking in the Multimedia 
category.  I see it more as a streaming library than as a network
library.  Same reasoning is probably true for the others.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
