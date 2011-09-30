From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 30 Sep 2011 09:48:39 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/pkg-infra
In-Reply-To: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LU6daQM2sFioskBF56wf7uKbyStJgPjuk6-VUR5faRfFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Sep 29, 2011 at 9:57 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This is yet another posting of my pkg-infra branch. I have to say that
> I am a bit annoyed by how this patchset has been handled.
>
> It has originally been posted on July, 20th, during the 2011.08
> cycle. That was of course too late for the 2011.08 release, but early
> enough to get some review and feedback to see it integrated in 2011.11.
>
> I therefore posted a new version on August 31th, only *ten* hours
> after the release of 2011.08. So we cannot say that I wasn't early in
> the release cycle. Another version has been posted no September, 19th
> as well.
>
> This the beginning of the 2011.11 release cycle, a lot of new
> packages, package bumps have been merged, but the core of this
> patchset has been mostly ignored. This is sad because everything
> should be done the other way around: first tackle the patchsets that
> touch the core infrastructure (which are likely the one to require the
> most extensive review, and the longest testing period), and only
> *then* tackle the relatively trivial changes on individual packages
> themselves (most of those can be merged until the last day before the
> release without too much risk).
>
> Maintaining this patchset (which touches *every* single package in the
> tree) while packages continue to be updated is a pain.
>
> Therefore, if there is no serious review and consideration of this
> patchset, this will be the last posting of it. Of course, this
> patchset being a bit complicated and sensitive, I will definitely
> understand if there are review comments and I am ready to make the
> necessary changes. However, if it keeps being ignored, then I'll just
> give up on it at this point.

It would be good, at least for me, if the contribution flow for
buildroot could be clarified.

If I understand correctly, Peter is the only person with write access
to the buildroot master, so in the end he is the only one that can
take action to get a patch merged.
On the other hand, I am under the impression that you have some kind
of privileged status as prime contributor, supplying pull requests to
Peter. These branches you prepare not only contain your own changes,
but you sometimes also pull in changes from others, making you some
kind of proxy to Peter.

From that perspective, I only provided comments to your patches when I
had some. Up until now, I have not really acked any of your patches on
which I had no comments but otherwise though were good. This for the
simple reason that I didn't think it would change anything about the
chances of your patches being merged, given my expectation that Peter
would 'trust' your changes and take them in.

It is very well possible that my understanding of this is wrong. That
Buildroot is maintained in a different way, that your patches are
treated in exactly the same way as other's, or that it *would* make a
difference if I acked patches or otherwise provided positive feedback.
Please let me know if this is the case.


Now that we're discussing contribution, what is the best approach to
get patches in once they were posted but forgotten? In the past I have
sent several patches, some of which got some feedback, some of which
did not. Many of these did not get merged. I have tried several
approaches over time, like bumping the original mails, adding you or
Peter directly in To:, poking Peter in private, or resending the
patch. I cannot really say that any of these methods had a high
success rate.
A few weeks ago, after my upgrading to buildroot-2011.08, I assembled
most remaining changes that I had made, and send them as a new set of
patch series. These did get noticed. Can I conclude that this is the
best approach for forgotten patches: send them again?

Thanks for clarifying,

Thomas
