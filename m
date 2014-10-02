From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 2 Oct 2014 21:29:02 +0200
Subject: [Buildroot] Pending "big" patch series
In-Reply-To: <20140923200255.1be119c9@free-electrons.com>
References: <20140914125321.0d68b842@free-electrons.com>
 <20140923200255.1be119c9@free-electrons.com>
Message-ID: <CAAXf6LXO2BWxZT920Qvxj0OTWfg28pU2VuOB8oM8QaLZjUaP2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

New status update on the open patches:

On Tue, Sep 23, 2014 at 8:02 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
>>  * gendoc infra: make it useable for other documents (18 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-September/105678.html
>>
>>    I'm personally not highly interested in making the gendoc infra
>>    suitable for other documents than the manual, so I'm not very
>>    motivated to review this. But maybe other persons are interested,
>>    especially Samuel or Thomas DS who have followed the gendoc changes?
>
> I've applied PATCH 1, but I've raised concerns on PATCH 2.

Series has largely been reviewed by Samuel and myself. There will be
at least v7, but I think the series will be ready for integration at
that version, since almost all patches have been Reviewed-by or
Acked-by.

>
>>  * fs/ext2: misc enhancements (4 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-September/105325.html
>>
>>    Needs review, nothing really complicated here.
>
> Still needs review/testing.

No change I think, still needs review/testing.

>
>>  * Introduce libudev (15 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-September/105309.html
>>
>>    Needs review and testing, but the patch series has gone through
>>    several iterations already, it should be almost good to go.
>
> Ditto.

Same.

>
>>  * OpenCV improvement (8 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-August/105208.html
>>
>>    Needs review.
>
> I've applied the first patch. But the second patch has some major
> comments from Yann that are unsolved. Samuel, can you resend a new
> version?

Samuel?

>
>>  * New GFX drivers (4 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-August/105179.html
>>
>>    Needs review.
>
> New version sent by Yann at
> http://lists.busybox.net/pipermail/buildroot/2014-September/106746.html.
> Still needs review and testing.

Same.

>
>>  * CMake cleanup (5 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-August/104794.html
>>
>>    Needs review.
>
> No change, still needs review.

Applied now.

>>  * toolchain: warn for unsafe library/header paths (12 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-August/104702.html
>>
>>    I have to respin with a new version.
>
> No change, it's on my TODO-list.

Same.

>
>>  * perl: add host variant (6 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-August/104654.html
>>
>>    We need to get that merged to solve some problems, but on the other
>>    hand, having to build host-perl as soon as a host Perl module is
>>    built is annoying.
>
> No change.

Same.

>
>>  * Add libgtk3 and bump webkit to version 2.4.3 (3 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-August/103387.html
>>
>>    Since the GSoC is over and Hadrien will not continue to work on
>>    Buildroot, someone needs to adopt those patches. Eric, maybe?
>
> Eric has taken over the libgtk3 patch and has sent a new version.
> Nobody has volunteered for webkit so far.

Same situation, AFAICS.

>
>>  * packages: rename _OPT into _OPTS (2 patches)
>>    http://lists.busybox.net/pipermail/buildroot/2014-July/103082.html
>>
>>    Thomas DS, could you respin this patch series?
>

Updated version sent, reviewed by Yann.
When the Peter or ThomasP are ready to merge this, there may be a
final rebase necessary or an additional patch to fix the newly
introduced issues, if any. Since the sed expressions are written in
the commit messages, that won't be a big problem.
http://lists.busybox.net/pipermail/buildroot/2014-September/107164.html


Best regards,
Thomas
