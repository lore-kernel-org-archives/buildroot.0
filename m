From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 Nov 2012 10:20:59 +0100
Subject: [Buildroot] [PATCH] perl: build with perlcross instead of qemu
In-Reply-To: <87pq3n6stb.fsf@dell.be.48ers.dk>
References: <1352425626-10628-1-git-send-email-arnout@mind.be>
 <878vab8cr8.fsf@dell.be.48ers.dk>
 <CABtOAfzb9n8HQ9Xbk1+1KnmTh7hHyxiQvD_7vPw5afs3YDyZMg@mail.gmail.com>
 <87pq3n6stb.fsf@dell.be.48ers.dk>
Message-ID: <509CCAFB.2030808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/12 10:15, Peter Korsgaard wrote:
>>>>>> "Alexander" == Alexander Khryukin<alexander@mezon.ru>  writes:
>
> Hi,
>
>   Alexander>  How about to include perl-cross into buildroot packages?
>
> I'm doing a test build right now, and will commit if that works. Perhaps
> it isn't perfect yet, but certainly better than all the qemu issues
> we're seing right now.

  BTW, please everybody do review this patch even after it's committed - there
could very well be some things that I missed and that can be caught with visual
review.  (Just look at the time that I sent the patch to know why :-)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
