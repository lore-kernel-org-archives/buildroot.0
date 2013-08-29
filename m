From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Aug 2013 09:39:03 +0200
Subject: [Buildroot] debugging inittab
In-Reply-To: <878uzlgdk3.fsf@dell.be.48ers.dk>
References: <2DD0B9C711CDFC45A3A266C78966CE7F451F39A0@G4W3291.americas.hpqcorp.net>
 <5216A076.5030409@mind.be>
 <2DD0B9C711CDFC45A3A266C78966CE7F451F8F81@G4W3291.americas.hpqcorp.net>
 <521ED985.9050705@mind.be> <878uzlgdk3.fsf@dell.be.48ers.dk>
Message-ID: <521EFA97.1010908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/13 09:29, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>   >> That was the problem. Thanks!
>
>   Arnout>  Right. Maybe we should just rename target/ to
>   Arnout> THIS_IS_NOT_YOUR_ROOT_FILESYSTEM instead of just creating the
>   Arnout> file. The latter is obviously not enough.
>
>   Arnout>  What was the reason we didn't do that in the first place?
>
> People didn't seem to like it when I suggested it.
>
> It would mean a change of behaviour, so perhaps we need to add a target
> symlink like we did for staging?

  That pretty much defeats the purpose, doesn't it?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
