From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Mar 2012 23:00:45 +0200
Subject: [Buildroot] [PATCH] New package: zxing
In-Reply-To: <CA+-urNQG9au7Y7MThu0ibXHiCkCU2Uio+vnBC3K9LXCjXtjNTw@mail.gmail.com>
References: <1332205009-31559-1-git-send-email-fhunleth@troodon-software.com>
 <201203252055.04278.arnout@mind.be>
 <CA+-urNQG9au7Y7MThu0ibXHiCkCU2Uio+vnBC3K9LXCjXtjNTw@mail.gmail.com>
Message-ID: <201203252300.45593.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 25 March 2012 22:48:12 Frank Hunleth wrote:
> >  Would it help to use buildroot's host-scons rather than the
> > packaged scons?
> 
> That was the approach that I was originally going to take, and then I
> got worried about there being any differences between host-scons and
> the packaged scons. I assume that they packaged scons with their
> release for a reason. Maybe it was just for convenience, but I wasn't
> sure. Not having used scons before, it using their packaged version
> seemed like the safe approach.

 I think the packaged version is only there because scons is usually not
installed on your system and they don't want to have external dependencies.
Only one way to find out: try it! :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
