From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 May 2013 19:16:49 +0200
Subject: [Buildroot] [PATCH v3 1/7] gstreamer1: Add gstreamer version
 1.0.7 package
In-Reply-To: <20130512112313.12a809e3@skate>
References: <1368158558-6069-1-git-send-email-spenser@gillilanding.com>
 <1368158558-6069-2-git-send-email-spenser@gillilanding.com>
 <518D8507.3060909@mind.be> <87k3n5yzj3.fsf@dell.be.48ers.dk>
 <20130512112313.12a809e3@skate>
Message-ID: <518FCE81.3070002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/05/13 11:23, Thomas Petazzoni wrote:
> On Sat, 11 May 2013 23:31:12 +0200, Peter Korsgaard wrote:
>
>> >  Arnout>  We have a tendency to make a copy of a package when there is a major
>> >  Arnout> version change, cfr. python3 and qt5. However, in this case, I don't
>> >  Arnout> think it's a good idea. At this time, many (most?) gstreamer
>> >  Arnout> downstreams have already moved to 1.x. Also, no more patches will be
>> >  Arnout> made the the 0.10 series (though distro's may still make patches). So
>> >  Arnout> we can expect the old gstreamer stuff to die out relatively
>> >  Arnout> quickly. But if we call the new thing gstreamer1 now, we're
>> >  Arnout> essentially stuck with that name for all eternity.
>> >
>> >I'm not so sure. If you look at the other recent major version upgrades
>> >(python/qt/gtk), it seems to me like people aren't jumping on the new
>> >version right away. I had several people asking me if qt4 would still be
>> >available once qt5 got added.
> I agree. I recently had a customer using Buildroot, with a fairly
> important stack of custom/proprietary software written on top of
> gstreamer 0.10. Having the possibility to continue to use gstreamer
> 0.10 is very important to allow such users to migrate to newer
> Buildroot versions. The migration to gstreamer 1.x will not happen
> overnight for such users who have a large body of software written
> against gstreamer 0.10.
>
> Similarly for Qt4 vs. Qt5, as Peter mentioned.

  Fair enough. I guess Peter's right, having the 1 in the name doesn't hurt.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
