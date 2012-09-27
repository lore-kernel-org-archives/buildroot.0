From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Sep 2012 12:42:32 +0200
Subject: [Buildroot] Fwd: Re:  Basic questions about using BuildRoot
In-Reply-To: <20120927115321.73a0e2b4@skate>
References: <CAAXf6LVtXq=OhWvqL27SzQjxUjOvd4yoisp1aAOUtqNSYJ1G0Q@mail.gmail.com>
 <5055A940.7070802@ronetix.at>
 <CAAXf6LXt1+Ee4B9BDE2ocj=6MqY0QdV5gMhn0x9JyTXR3zfyEw@mail.gmail.com>
 <5055C935.3050108@ronetix.at>
 <CAAXf6LUrzxDXUmLdwkKZFaB-H_q_XC+ybkt+_bBZO=0EgfbffA@mail.gmail.com>
 <5058F058.1020806@mind.be> <505AB58C.3030805@ronetix.at>
 <50641497.3030800@ronetix.at> <20120927115321.73a0e2b4@skate>
Message-ID: <50642D98.8030603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/27/12 11:53, Thomas Petazzoni wrote:
> Don't worry too much about the kernel headers version, it doesn't have
> to match exactly the kernel you're running. It should just be*older*
> than the kernel version you're running on the board.

  But the oldest version we provide is 2.6.37 - and even that one is
marked as deprecated.

  We really should refactor kernel-headers so it refers to the main kernel
source, if that is configured.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
