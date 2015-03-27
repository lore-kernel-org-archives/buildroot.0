From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Mar 2015 22:57:20 +0100
Subject: [Buildroot] [PATCH v9] package/sysdig: New package
In-Reply-To: <CA+TH9Vn6t-bT78+Z8iGFq7X3ftnbZqk0-mzoQJgVODDLpQmG-Q@mail.gmail.com>
References: <1427356117-27840-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAMQcK5KZ89uEWt_9BqZ=Cdo2JXHfzKsMaaSAZoN71bdkEvNi9Q@mail.gmail.com>
 <CA+TH9Vn6t-bT78+Z8iGFq7X3ftnbZqk0-mzoQJgVODDLpQmG-Q@mail.gmail.com>
Message-ID: <5515D240.9070200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/03/15 21:37, Angelo Compagnucci wrote:
> Dear Ryan Barnett,
> 
> 2015-03-26 19:38 GMT+01:00 Ryan Barnett <ryan.barnett@rockwellcollins.com>:
>> > Hi Angelo,
>> >
>> > On Thu, Mar 26, 2015 at 2:48 AM, Angelo Compagnucci
>> > <angelo.compagnucci@gmail.com> wrote:
>>> >> Sysdig is open source, system-level exploration:
>>> >> capture system state and activity from a running Linux
>>> >> instance, then save, filter and analyze.
>>> >>
>>> >> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> >
>> > It would be good to carry forward previous reviews when you submit a
>> > new version of a patch. In your v8 of this patch Yegor Yefremov
>> > reviewed your patch so after your Signed-off-by line you should put
>> > this:
>> >
>> > Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> Are you sure? IMO, If the patch changes it should be reviewed again.

 It basically depends on how much you still changed after that reviewed-by was
given. In this case, it indeed probably changed too much to keep the tag.

 For Yegor's convenience, however, it could be good to add something like:

Previous-version-reviewed-by: ...

(At least in my case, I tend to look more carefully at the patches I reviewed
before, and I tend to forget which ones I reviewed in the past.)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
