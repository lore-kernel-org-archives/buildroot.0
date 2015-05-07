From: Nathaniel Roach <nroach44@gmail.com>
Date: Thu, 07 May 2015 16:21:18 +0800
Subject: [Buildroot] Proposal to remove patches from patchwork,
	or find adopters
In-Reply-To: <20150506235353.7740a9d3@free-electrons.com>
References: <20150506235353.7740a9d3@free-electrons.com>
Message-ID: <554B207E.7050608@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apologies Thomas, it's assignment season and I brushed off your first email.

RE my patch (package/systemd: journald should use volatile storage):
The bug it works around (#7892) as far as I can tell, is still an issue.

I'd prefer that the patch remains as a work around for the issue, but it 
isn't a big deal either way, and is your call.

I've updated the bug with the details discussed in IRC a while ago.

On 07/05/15 05:53, Thomas Petazzoni wrote:
> Hello,
>
> On April 21th, I sent a personal reminder to all the patch authors who
> had patches older than 15 days pending in Buildroot's patchwork.
>
> Since then, a number of authors have responded to indicate whether they
> are still interested or not by their patches, which is great.
>
> However, a fairly significant portion of the patches have not been
> given any feedback by their respective authors. I have triaged the
> answers from the authors, and classified such patches. The list of such
> patches follows. Note that the authors of such patches are again added
> in the To: field of this e-mail, to get their attention.
>
> I hereby propose to mark all those patches as "Rejected" on May 21 (i.e
> one month after the reminder), if the authors still haven't expressed
> interest and nobody else volunteered to adopt the patch. I believe we
> can't keep for months or years patches that the original author has
> lost interest in, and nobody else seems to be interested in.
>
> Let me know if you agree or disagree with this proposal.
>
> Volunteers interested in adopting one or several of the below patches,
> please speak up.
>
> Here is the list of such patches:
--snip--
>
> Thanks,
>
> Thomas Petazzoni
>
