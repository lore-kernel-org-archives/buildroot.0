From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2012 21:57:11 +0100
Subject: [Buildroot] [PATCH] libtool version update 2.4.2
In-Reply-To: <20121112112637.42d1a425@skate>
References: <1352464732-22984-1-git-send-email-alexander@mezon.ru>
 <20121110105308.740a3bfa@skate> <50A02018.1000804@mind.be>
 <20121111230546.709735e3@skate> <50A0A952.5090001@relinux.de>
 <20121112112637.42d1a425@skate>
Message-ID: <50A162A7.3080901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/12/12 11:26, Thomas Petazzoni wrote:
> Stephan,
>
> On Mon, 12 Nov 2012 08:46:26 +0100, Stephan Hoffmann wrote:
>
>> did you ever think about inventing a kind of "testing" branch with a
>> seperate autobuilder running on? That could keep major build problems
>> away from the master branch.
>
> Yes, this has been discussed during the Developers Meeting, at least
> for the "next" branch that gets created once -rc1 is out, to accumulate
> patches for the next release.

  Actually it does make sense to have it in general.  We could allow more committers
on that branch, and Peter could cherry-pick from it, which could save him a few
seconds per patch.  And it could make master slightly more stable, because only
patches that don't kill the autobuilders would get cherry-picked.

  Maybe something to discuss in February.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
