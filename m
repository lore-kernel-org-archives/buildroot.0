From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Nov 2012 23:00:56 +0100
Subject: [Buildroot] [PATCH] libtool version update 2.4.2
In-Reply-To: <20121110105308.740a3bfa@skate>
References: <1352464732-22984-1-git-send-email-alexander@mezon.ru>
 <20121110105308.740a3bfa@skate>
Message-ID: <50A02018.1000804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/12 10:53, Thomas Petazzoni wrote:
> Alexander,
>
> On Fri,  9 Nov 2012 16:38:52 +0400, Alexander Khryukin wrote:
>
>> -LIBTOOL_VERSION = 2.2.10
>> +LIBTOOL_VERSION = 2.4.2
>
> How much testing did you give to this version bump? A libtool version
> bump is a very sensitive operation, as host-libtool is used to
> autoreconfigure many packages in Buildroot. Therefore, this patch needs
> a good amount of testing before being committed (ideally testing that
> all packages having<foo>_AUTORECONF = YES still build).

  Can't we rely on the autobuilders to do that?

  That said, I wouldn't do this for 2012.11 anymore...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
