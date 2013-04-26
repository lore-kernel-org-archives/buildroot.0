From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Apr 2013 07:58:54 +0200
Subject: [Buildroot] [PATCH 0/2] Download patches for Busybox
In-Reply-To: <8738ugcvdw.fsf@dell.be.48ers.dk>
References: <1366770167-22834-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <8738ugcvdw.fsf@dell.be.48ers.dk>
Message-ID: <517A179E.4000305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/04/13 08:09, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
>   Thomas> Hello,
>   Thomas> As recently discussed on the list, here are two patches that
>   Thomas> let the busybox package download its patches, instead of
>   Thomas> storing them in Buildroot's source tree.
>
> Thanks. There's one big problem with busybox though. Denys tends to
> update the patches without renaming them if more problems are found in
> those applets - So we end up with different results depending on when
> you build.
>
> Perhaps we can convince him to do otherwise, but until then I would
> prefer to keep it like it is.

  I'd still include patch 1/2, though.

  Or actually, there's another patch still pending that allows a full URL 
as the patch name; that would be even more interesting. I'll quickly ack 
that patch.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
