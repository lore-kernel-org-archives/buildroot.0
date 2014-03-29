From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 11:28:38 +0100
Subject: [Buildroot] [PATCH 0/9] Documentation cleanup
In-Reply-To: <533697E6.5000804@trzebnica.net>
References: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20140329093317.29e80f16@skate> <533697E6.5000804@trzebnica.net>
Message-ID: <20140329112838.0bee5010@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Sat, 29 Mar 2014 10:52:38 +0100, Jerzy Grzegorek wrote:

> Regarding the "may be added", I agree.
> I proposed this change because I saw on mailing list both cases of
> submitting patch series introduced by a cover letter:
> 
>   * "in addition" case:
>      [Patch vX 0/Y] ...
>      [Patch vX 1/Y] ...
>      ...
>      [Patch vX Y/Y] ...
> 
> * "instead" case:
>      [Patch vX 0/Y] ...
>      [Patch 1/Y] ...
>      ...
>      [Patch Y/Y] ...

To me, this second variant is wrong. This is because the cover letters
are not recorded by patchwork, so if the version is not mentioned in
the title of each individual patch, patchwork will not have the
information of the version of the patches.

> So maybe it should be:
> "Note that when your patch series is introduced by a cover letter,
> a patch version should be added to the cover letter in addition to
> the individual commits."

But is it really necessary? Such a wording seems to imply that the
contributor would have to do this manually, while the contributor
should instead simply use "git format-patch --subject-prefix", which
does just the right thing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
