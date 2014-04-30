From: sergey kostanbaev <sergey.kostanbaev@gmail.com>
Date: Wed, 30 Apr 2014 19:19:53 +0000
Subject: [Buildroot] Patchwork cleanup #8: submitter notification
In-Reply-To: <CAAXf6LWPZAF2gMAFantNzF_KEuKNYheSCD0Qcs19Zgab7kU0Ow@mail.gmail.com>
References: <CAAXf6LWPZAF2gMAFantNzF_KEuKNYheSCD0Qcs19Zgab7kU0Ow@mail.gmail.com>
Message-ID: <CAGtNMfP0N9Eboo1a4pkK9owvtne4uMr20nkWoXKAXh+GbjS-dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'll try to update my patches.

Best regards,
Sergey


On Tue, Apr 29, 2014 at 7:48 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> People in To,
>
> The buildroot community is trying to clean up the backlog of unhandled
> patches sent to the mailing list (logged in patchwork [1]). We are
> starting from the oldest patches and working our way up towards the
> present.
>
> In this mail, one or more patches you sent to the buildroot list are
> put in one of four categories:
> A. to be refreshed and resent to the list
> B. rejected
> C. we're unsure, your feedback is requested
> D. more thorough changes needed instead of the current patch
>
> If one of your patches falls into category A, it will be added to the
> buildroot todo list, meaning that someone will eventually take the
> time to refresh and resend the patch. However, if you can spare some
> time to do it yourself, then this will greatly accelerate the
> inclusion of your patch in buildroot.
>
> If one of your patches falls into category B, you can either accept
> the reasons given, or you may disagree in which case we invite you to
> discuss the matter with us. In this case, please explain why you think
> the patch should still be accepted.
>
> If one of your patches falls into category C, please provide more
> feedback. For some patches, our question to you may be if you are
> still interested in getting this patch in buildroot or not. Other
> patches may be in this category because we don't fully understand its
> purpose (yet). Your feedback will help us in making the right choice.
>
> If one of your patches falls into category D, the buildroot developers
> accept the problem that the patch is addressing, but believe it should
> be fixed in a different way, possibly requiring some changes in the
> buildroot core infrastructure.
>
> We propose a two-week period to give you some time to respond with
> your feedback.
>
> For this cleanup session, here are the patches:
>
> [RFC,5/7] python-linaro-dashboard-
> bundle: new package
> ludovic.desroches at atmel.com
> http://patchwork.ozlabs.org/patch/282728
>
> [RFC,6/7] lava-tool: new package
> ludovic.desroches at atmel.com
> http://patchwork.ozlabs.org/patch/282729
>
> [RFC,7/7] lava-test: new package
> ludovic.desroches at atmel.com
> http://patchwork.ozlabs.org/patch/282730
>
> Ludovic said he would revise/retest/resubmit these patches, also
> taking into account the new python-package infrastructure. The patches
> are thus marked as Changes Requested in patchwork.
>
>
> package/makedevs: add "l" type for symlinks ownership change
> angelo dureghello <angelo70@gmail.com>
> http://patchwork.ozlabs.org/patch/283015
>
> C unsure: Angelo: could you describe in more detail if you are still
> using this patch, and why you need it? How come the symbolic link does
> not have the right ownership from the start?
>
>
> [v9] espeak: new package
> Arnaud Aujon <arnaud.aujon@gmail.com>
> http://patchwork.ozlabs.org/patch/284229
>
> python-sip: new package
> Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
> http://patchwork.ozlabs.org/patch/284873
>
> python-pyqt: new package
> Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
> http://patchwork.ozlabs.org/patch/284874
>
> Above three patches: A keep. If the original submitters could refresh
> and resend the patches, that would be great. Otherwise it will be
> added to the buildroot TODO list awaiting an adopter.
>
>
> [RFC,1/2] host-xxd: new package
> Ryan Barnett <rjbarnet@rockwellcollins.com>
> http://patchwork.ozlabs.org/patch/285936
>
> [RFC,2/2] uboot: introduce u-boot.pbl format
> Ryan Barnett <rjbarnet@rockwellcollins.com>
> http://patchwork.ozlabs.org/patch/285937
>
> Above two patches are still in progress by Ryan. As Ryan is still
> active in Buildroot development, the patches will be marked as Changes
> Requested in patchwork so they are no longer in the 'active' queue.
>
>
> [1/3] ccache: change compilercheck to use compiler and toolchain info
> Danomi Manchego <danomimanchego123@gmail.com>
> http://patchwork.ozlabs.org/patch/287383
>
> D more work needed. Looking at Arnout's
> comments on the first patch, this needs to be thought through, and a
> final solution is to be implemented. I really think we should improve
> ccache in buildroot, though, so I hope a proper solution can be found.
> Danomi mentioned he has no bandwidth at the moment to pull this, so
> it's up to others. Thanks Danomi for all the work you've spent on this
> so far!
>
>
> [2/3] ccache: change default cache directory path to match config setting
> Danomi Manchego <danomimanchego123@gmail.com>
> http://patchwork.ozlabs.org/patch/287384
>
> [3/3] ccache: provide capability to do initial ccache setup
> Danomi Manchego <danomimanchego123@gmail.com>
> http://patchwork.ozlabs.org/patch/287385
>
> Danomi indicated that the above two patches are indepedent from the
> first one. I'm triaging it as A, and hope to be able to refresh it (or
> someone else).
>
>
> Best regards,
> Thomas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140430/32b29fe9/attachment.html>
