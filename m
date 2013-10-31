From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 31 Oct 2013 18:10:36 +0100
Subject: [Buildroot] [PATCH] arch/mips: Set BR2_GCC_TARGET_ARCH for MIPS
In-Reply-To: <20131031155521.7c17a702@skate>
References: <1382970069-16449-1-git-send-email-markos.chandras@imgtec.com>
 <20131030184534.7bf2477b@skate>
 <CAAXf6LVCOqiCdQfy+S_YRiA2c1fzGpip36=hM4c6M+cV=S47og@mail.gmail.com>
 <20131031102253.1aeaea28@skate>
 <CAAXf6LVZW++12ECLBa0MoHUdjFKXdYy0ueoSk4a6WpvxYuAyJA@mail.gmail.com>
 <52722E32.7050307@mind.be> <20131031114727.681766bb@skate>
 <CAAXf6LVY7YE0ZmtT7EFouvnvRpja4sqdWV+ceYU_e9-iHVQyqw@mail.gmail.com>
 <20131031155521.7c17a702@skate>
Message-ID: <CAAXf6LW4angtN30SpTaU=gOXP0r9YWHBug1-uVVgejnHcm1U=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Oct 31, 2013 at 3:55 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 31 Oct 2013 13:45:43 +0100, Thomas De Schampheleire wrote:
>
>> I think we need a single strategy to be used by all maintainer-proxies.
>> The problem with not resending the patches is that the
>> maintainer-proxy (or whatever you want to call it) needs to have a git
>> tree accessible by Peter. Although not impossible, I'm not really fond
>> of it.
>>
>> Also, consider this scenario: a developer submits a patch on day 1, a
>> maintainer-proxy adds the patch to his branch on day 2. However,
>> another contributer gives some remarks on the patch and expects it to
>> be reworked. The maintainer-proxy could forget about this when v2 of
>> that patch is sent. In this case, v2 is pending in patchwork, and v1
>> is on a branch for which a pull request is sent. The actual contents
>> of the branch is not visible on the list. This opens a window for
>> errors. By sending the patches to the list, there is a bit more
>> visibility. The downside is that the list gets additional mails.
>>
>> An additional question is: is there a policy on who takes which
>> patches, if certain actions need to be taken on these patches, etc.?
>> At this moment, I still don't really see the difference between
>> providing an Acked-by: and adding a patch to a for-peter branch,
>> except for the fact that incoming patches are prearranged in batches
>> for Peter.
>
> What I merely intended to do with the for-peter-2013.11 is to act
> more-or-less as an interim maintainer during the short period Peter is
> not available. I've done this before (i.e not having commit access to
> the official repository, but gathering relevant patches in a branch,
> until Peter comes back). The idea here is that there would be only one
> such 'interim maintainer' at a given point in time.

Ah, I had interpreted this branch according to the strategy discussed
at last BDD regarding the community organization. In that discussion,
such aggregation of submitted patches was also proposed. I thought you
were acting in that mode.

In that more general case, where there would me more than one
maintainer-proxy, the exact strategy is still somewhat unclear to me.

Best regards,
Thomas
