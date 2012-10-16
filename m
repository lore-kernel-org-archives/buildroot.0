From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Oct 2012 21:14:39 +0200
Subject: [Buildroot] [git commit] package: add gnupg
In-Reply-To: <87ipaatf0w.fsf@macbook.be.48ers.dk>
References: <20121015082204.6813A99871@busybox.osuosl.org>
 <20121016185610.36a03eff@skate> <87ipaatf0w.fsf@macbook.be.48ers.dk>
Message-ID: <507DB21F.1090506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/12 21:04, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni<thomas.petazzoni@free-electrons.com>  writes:
>
>   >>  3 files changed, 84 insertions(+), 0 deletions(-)
>
>   Thomas>  This is causing the following build breakage on various platforms:
>
>   Thomas>    http://autobuild.buildroot.org/results/07f97705dda6dfbeab8ce95d6cef5b016329c9ce/build-end.log
>
> Yes - I noticed as well, just haven't found time to look closely at it
> yet. The mpi stuff has cpu specific backends, so that's probably where
> it goes wrong.

  I think this is the reason why gnupg wasn't included before.  My colleague
Stijn submitted a patch series for a more recent version of gnupg a while ago,
and that also faced a portability problem (in the 'portable threads library :-)
Thomas suggested to wait for npth-based gnupg 2.1, but that one hasn't been
released yet.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
