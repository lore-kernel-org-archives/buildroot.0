From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 2 May 2014 13:05:57 +0200
Subject: [Buildroot] 2014.05 release cycle: open patches to consider
In-Reply-To: <CAAXf6LXWw5ybnPVNgjaadipuhG9PTv8LLsCzpnSC9h6QMNq9iA@mail.gmail.com>
References: <CAAXf6LWk1C0uUjY3-5=a0347TnQyBRym9SpQUZN=xj0aNfNRNg@mail.gmail.com>
 <CAAXf6LXWw5ybnPVNgjaadipuhG9PTv8LLsCzpnSC9h6QMNq9iA@mail.gmail.com>
Message-ID: <CAAXf6LWEQqQGHmaBijBhZ2PMLxx2cPZFvLbxutr1JxcdzOE6iA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, May 2, 2014 at 10:33 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> [Grr, buildroot list in copy]
>
> Hi,
>
> During the last Buildroot Developer Days in February, we concluded on
> the goal of having no patches older than 6 months in patchwork, at the
> time of the release.
>
> Excluding the patches triaged during the patchwork cleanup sessions,
> we have reached that goal for the 2014.05 release (hooza!). The oldest
> patches are from November 2013.
>
> Since we are starting the stabilization month for 2014.05, I won't try
> to push real feature patches anymore, but there are a number of
> improvement/bugfix patches in patchwork that I believe could still be
> applied.
>
> Some of these patches have not received any review/ack/test, or may
> need to be rebased. So this is an action point to the community:
> review, test and/or rebase these patches to help get these patches
> integrated!
>
> Here is the list of patches that I think should be considered for
> 2014.05 still: (starting from the oldest first, not including the very
> latest patches)
>
> http://patchwork.ozlabs.org/patch/305422/
> package: unification of use $(subst [._-], [._-], $(<PKG>_VERSION)) macro
> Jerzy Grzegorek

A newer version seems to be applied already:
c4cc84afc60bbfa34b405ac1589a52087212fd84
So I'm marking the former patch as Superseded.

Best regards,
Thomas
