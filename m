From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 Nov 2012 10:15:06 +0100
Subject: [Buildroot] [PATCH] perl: build with perlcross instead of qemu
In-Reply-To: <CABtOAfzb9n8HQ9Xbk1+1KnmTh7hHyxiQvD_7vPw5afs3YDyZMg@mail.gmail.com>
References: <1352425626-10628-1-git-send-email-arnout@mind.be>
 <878vab8cr8.fsf@dell.be.48ers.dk>
 <CABtOAfzb9n8HQ9Xbk1+1KnmTh7hHyxiQvD_7vPw5afs3YDyZMg@mail.gmail.com>
Message-ID: <509CC99A.4010700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/12 09:58, Alexander Khryukin wrote:
>
>
> 2012/11/9 Peter Korsgaard <jacmet at uclibc.org <mailto:jacmet@uclibc.org>>
>
>     > >>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout at mind.be <mailto:arnout@mind.be>> writes:
>
>     Hi,
>
>       Arnout> Peter, if Francois confirms that the perl binary actually runs
>       Arnout> and if he has no other concerns, then I'd commit this patch
>       Arnout> quickly and wait for the autobuilder fallout.
>
>     I completely agree, thanks for doing this!
>
> How about to include perl-cross into buildroot packages?

  Doesn't make sense.  perlcross has to be extracted over the perl source: it
replaces a few configuration scripts and creates a few more.  There is nothing
in there to install on the host or on the target.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
