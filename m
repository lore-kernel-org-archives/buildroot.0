From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Jul 2012 13:23:45 +0200
Subject: [Buildroot] [PATCH 2/3] ncurses: bump to 5.9
In-Reply-To: <20120727122843.3b28ddf3@skate>
References: <1343328590-1803-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1343328590-1803-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <50119743.3090505@zacarias.com.ar> <20120727085945.1b6339ab@skate>
 <50126BB3.2070502@zacarias.com.ar> <20120727122843.3b28ddf3@skate>
Message-ID: <50127A41.6080805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/12 12:28, Thomas Petazzoni wrote:
> But still, PTXdist and OE have it. So it should work somehow. And they
> don't seem to have bizarre patches.

  Does the segfault issue also occur on arm or powerpc?  Neither PTXdist
nor OE is a big i386 user, so maybe they just didn't notice the problem.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
