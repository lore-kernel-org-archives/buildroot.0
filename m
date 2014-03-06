From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 06 Mar 2014 21:59:46 +0100
Subject: [Buildroot] Patchwork cleanup: proposal
Message-ID: <092927c1-b383-4e46-bc8d-c6ce491b0e98@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

The current patchwork cleanup sessions were organized as follows: every two weeks I would send a mail with the 10 oldest patches, asking the authors and the community whether the patch was still relevant or not. This would result in either of: rejection, acceptance, resend to the list.

Although this approach has worked fine so far, the biggest disadvantage of it is its slowness: with 10 patches every two weeks, and given two months of feature development during a buildroot release, this means that only about 40 patches can be closed this way per release.

My observation of these cleanup sessions is that there is some initial response when the mail is sent, then there is quiet time, and then again some response around the reminder mail and the final decision mail, with quietness in between. This leads to quite some lost time.
Moreover, while originally I thought we would resend the acceptable patches to the list during these two weeks, in practice it doesn't happen that way.

During the Buildroot developer days at FOSDEM last February, Thomas Petazzoni and I spent some time triaging the patchwork list as well. This went very well: on a very short time frame (a few hours) we were able to triage many patches, at a much faster rate than with the regular patchwork cleanup sessions.
At the same time, some other people, like Samuel and Maxime, were taking in the patches that we triaged, refreshing and resending them.

I would like to adjust the patchwork cleanup sessions based on this experience: instead of having fixed-duration, sequential sessions of two weeks, where the final triaging decision is taken at the end based on input of the submitters, I would like to propose the following:

- a triaging proposal for a number of patches is sent to the list when time permits. As I'm currently leading these cleanup sessions this would be done by me, but others could help here too. There is no limit on the amount of patches that can be triaged in a given timeframe.

- the triaging proposal is reviewed by other Buildroot developers. This agreement/disagreement phase shouldn't take long.

- the output of this triaging can be:
    A. We want this patch and someone should refresh and resend it.
    B. We don't want this patch as it goes against Buildroot principles.
    C. we're not sure and want to know if the submitter is still interested in pursuing this patch.

- In case A, ideally the original submitter refreshes the patch and resends it. If not, it ends up on the todo list.
- In case B, there is nothing to be done.
- In case C, the submitter (and other developers) get two weeks to provide feedback. When no feedback is provided, the patch is rejected.

In a separate mail than the one with the triaging proposal, submitters are notified of this decision.


The biggest advantage of this way of working would be the possibility to triage more patches in each release, while still providing submitters sufficient time to react.

Let me know what you think of this...

Best regards,
Thomas
