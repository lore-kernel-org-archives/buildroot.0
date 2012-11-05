From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 05 Nov 2012 13:17:42 +0100
Subject: [Buildroot] [git commit] package: drop games/ subdir
In-Reply-To: <5097A1CD.30009@petroprogram.com>
References: <20121105081344.74B5F99BE5@busybox.osuosl.org>
 <5097A1CD.30009@petroprogram.com>
Message-ID: <5097AE66.1080607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/12 12:23, Stefan Fr?berg wrote:
> 5.11.2012 9:23, Peter Korsgaard kirjoitti:
>> commit: http://git.buildroot.net/buildroot/commit/?id=9b809e1a6ad2a82bfe0d2383f69f45ae8c6283bb
>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> As discussed during the dev day.

  Looks like I was distracted when it was discussed, because I didn't write it in the
report. But that's probably not really needed anymore...

[snip]
> Aww...
>
> And I had just finished porting dosbox, DOS emulator that can run old
> classic DOS games
> and programs, to buildroot.
>
> No games for buildroot developers/users then ?

  It just moved out of the games/ subdirectory, e.g. package/doomwad instead of
package/games/doomwad.

  The general idea is that the subdirectories are confusing and we want to get
rid of them.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
