From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 14:23:46 +0100
Subject: [Buildroot] Help reviewing/testing patches
Message-ID: <20160222142346.5e910b73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

The queue of pending patches in our patch tracker [1] remain quite long,
with 290 patches pending at the time of this writing. I know some of
you are annoyed by the time it takes to get patches merged.

If you want to speed up the merge of patches, then the best thing you
could do is to review and test patches. I did a quick stat, and on the
290 pending patches, only 27 of them had at least one Reviewed-by,
Acked-by or Tested-by tag.

Yes, you could say that it's 27 patches that the Buildroot maintainers
should have looked at or applied, but it also means there's 263 patches
that are waiting for anyone to review/test them :-)

It is *very* useful when looking at a patch to see that someone else
has already build tested, or even runtime tested, has verified the
license, has verified the dependencies, etc. Of course, the more you
say about what you have reviewed/verified, the more valuable your
review is.

If you review a patch and ask the submitter to do some changes that are
fairly significant, do not hesitate to ask us to mark the patch as
"Changes Requested" in patchwork (ask us by e-mail or IRC to change the
status of a patch). However, if the changes needed are minor, then
Peter or I can typically handle them directly while applying, which
avoids another potentially lengthy round-trip with the original
submitter.

Thanks a lot for your participation!

Thomas

[1] http://patchwork.ozlabs.org/project/buildroot/list/
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
