From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Jul 2015 00:19:21 +0200
Subject: [Buildroot] [PATCH V4] sdl2: new package
In-Reply-To: <559A8138.1010802@oliseo.fr>
References: <20150629222241.GF3669@free.fr>
 <1435824981-6312-1-git-send-email-guillaume.gardet@oliseo.fr>
 <559975AD.9030004@openwide.fr> <559A71C7.6080804@oliseo.fr>
 <20150706142647.6ad4d9fb@free-electrons.com> <559A8138.1010802@oliseo.fr>
Message-ID: <559C5069.9010309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Guillaume,

 Let me start with thanking you for this feedback, since we are indeed
struggling with improving our patch contribution flow.

On 07/06/15 15:23, Guillaume GARDET - Olis?o wrote:
> Le 06/07/2015 14:26, Thomas Petazzoni a ?crit :

>> However, I do agree that we could do better to reply to patches in a
>> timely fashion. And to make this happen, we need *your* help to look at
>> patches from others.
> 
> From my point of view, other projects, like u-boot, are more patch-friendly than
> Buildroot. Especially for new contributors.

 Could you explain what aspect(s) of the U-Boot contribution process make it
more patch-friendly? It indeed looks like their patch queue is shorter even
though they seem to get the same order of magnitude of contributions.

 Are they less critical about patches?

 Are patches taken over by maintainters so the original contributor doesn't have
to respin it too often?

 Do they make sure review happens quickly?

 Are they able to avoid that patches that had no review for a week are
completely ignored for a long time? How do they do that?


> You cannot ask all patch senders to become reviewers or testers.

 We certainly can ask. We can't *require*.

> 
> It could make sense to split Buildroot tree with maintainers for each part as it
> is done for the kernel or u-boot. It will avoid that people comments here and
> there.
> Another solution would be that 1 person/team flags a given patch and this
> person/team follows the patch submission flow. Maybe using the "Deleguate" flag
> in patchwork tool.

 We do try to make sure of that (i.e. the first reviewer continues to look after
the patch), but indeed we have no formal process for it and it's all based on
goodwill.


> It may be fine to merge a patch even if it is not really perfect (e.g. does not
> offer all options) and then ask for updates/improvements. That way, it allows
> someone else to do the following patch.

 I think the fear is that the improvements will never materialize, and we get
stuck with imperfect packages. A typical package will not be looked at again for
a very long time, but on the other hand every package may be one that a new
contributor is looking at as an example of how things should be done...



> 
> I write these to help you to improve your work flow, not just to say it is
> better elsewhere.

 Again, we really appreciate this.

> 
> That said, do you really think that 5 versions (if I include the next one) is
> really something normal for a simple single package which does not affect others?
> I think 3 or 4 should be enough.

 Ideally, 1 iteration should be enough :-)


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
