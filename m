From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 13 Sep 2013 10:55:28 -0500
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree
	Buildroot	customization
In-Reply-To: <CAAXf6LXr0Ry1VFZ2zFBLqsKWRL_sYpBKjK-Bmj0AvxWmUK36fQ@mail.gmail.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <CAAXf6LXr0Ry1VFZ2zFBLqsKWRL_sYpBKjK-Bmj0AvxWmUK36fQ@mail.gmail.com>
Message-ID: <OFEFD17561.DD46E961-ON86257BE5.0050E11C-86257BE5.00577A0F@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 
09/13/2013 02:35:04 AM:

> Hi Thomas,
> 
> On Thu, Sep 12, 2013 at 8:21 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Dear Thomas De Schampheleire,
> >
> > On Thu, 12 Sep 2013 09:54:56 +0200, Thomas De Schampheleire wrote:
> >
> 
> >> The upstreaming work is currently done by one person (me) and this is
> >> clearly the weak point. If I stop paying attention to upstreaming, or
> >> to keeping the changes we make upstreamable, the delta between our
> >> development repo and mainline buildroot becomes so large that it is a
> >> nightmare to keep up with newer releases.
> >
> > Do you think there is something we can do at the Buildroot level to
> > ease this process?
> 
> I don't think there is much to do about that. The buildroot community
> is very open and active, so there is no real reason why others
> couldn't do what I do. The 'time' aspect is the only hurdle I have
> experienced in the past, in two ways:
> 1. upstreaming changes requires effort and time from the developer
> side, in order to prepare the patch in the first place, send it, and
> update after comments. All this in several cycles depending on the
> comments. In a typical company mindset, upstreaming is not a first
> priority, so these tasks go in-between other stuff.
> Except for encouraging companies and other forks to upstream their
> changes as much as possible, there is little the buildroot community
> can do here.
> 
> 2. sometimes patches get very little, if any, response. Especially in
> the beginning of my contributions, this was very frustrating. I pinged
> patches, re-sent them, even multiple times, and still not even a
> comment was given. I can imagine that not everyone continues trying,
> and several people will just give up, tagging the buildroot community
> as 'not accepting patches'.

As being someone who is rather new member of the community, I guess 
I've received almost quite the opposite reaction from the community. 
When posting patches back to mailing list I've received good feedback
that has been very critical and much better than anything our company
has been able to do internally. I've even made my biggest issue known
and in attempt for comment for comments on how I could come up with 
something to fix the problem - Thomas Petazzoni addressed it. So
in a little way I feel great about the discussion I've spawned.

> The situation has certainly improved since then, I think: the
> introduction of patchwork helps keeping track of open patches, and
> although I have not kept numbers I think the community certainly has
> grown, and there are now several more people systematically reviewing
> patches so that the burden does not fall entirely on Peter and
> yourself.

I'm going to start a new discussion thread - [RFC] Effective Patchwork 
Use and Patch Review - on my thoughts about the review process and
I how I'm finding it difficult to use. 

> I think we should still keep an eye on this though. I think it still
> happens that patches are sent by 'new' people in the community, and
> there is little or no reaction. Sometimes the patch does not really
> fit in our general belief of how buildroot should be, but maybe we
> don't always dare to say it. Or sometimes the patch is so specific
> that it is hard to  give a good review, so one waits until someone
> else with more experience in that area gives some comments, which may
> never happen.
> Ideally, patches should stay no longer than a fixed amount of time in
> patchwork. Either the patch is given some comments and we
> wait/encourage for the submitter to send an updated version, or we
> reject the patch with some explanation, or we ask more details so we
> can either accept/reject it with more background. This may not be
> feasible for all patches. Sometimes there is simply no-one who really
> needs the extra feature/fix except the submitter himself, but that is
> not necessarily a reason not to accept the patch.


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130913/997f042d/attachment.html>
