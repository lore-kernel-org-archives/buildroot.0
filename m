From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 30 Apr 2015 11:02:34 +0200
Subject: [Buildroot] Reminder about your pending Buildroot patches
In-Reply-To: <20150421124259.6DAD988C@mail.free-electrons.com>
References: <20150421124259.6DAD988C@mail.free-electrons.com>
Message-ID: <CAHXCMMKDA5ETYojeCMRCg3TT5X==EZKxN+9OE5oVy3xM8iCidA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Apr 21, 2015 at 2:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This is a reminder about your Buildroot patches that are older than 30
> days.
>
> We need your help to know if your patches are still relevant or not.
> To help us, make sure to update the status of your patches in
> patchwork as appropriate, or to resend an updated version that applies
> on the latest Buildroot master. Especially let us know if you would
> like to withdraw your patch if you are no longer interested.
>
Sorry for the late response here :-s
For the changes below, I won't be able to repost them before the
2015.05 is closed, but here is a status:

> Here is the list of patches you have submitted that are still pending:
>
>  - [v4,1/9] package/opencv: update opencv options after last version bump
>    http://patchwork.ozlabs.org/patch/396923/
>
>  - [v4,2/9] package/opencv: add Qt5 support
>    http://patchwork.ozlabs.org/patch/396924/
>
>  - [v4,3/9] package/opencv: add python/numpy support
>    http://patchwork.ozlabs.org/patch/396925/
>
>  - [v4,4/9] package/opencv: add Gstreamer-1 support
>    http://patchwork.ozlabs.org/patch/396926/
>
>  - [v4,5/9] package/opencv: define modules inter-dependencies
>    http://patchwork.ozlabs.org/patch/396928/
>
>  - [v4,6/9] package/opencv: add hidden symbol BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS
>    http://patchwork.ozlabs.org/patch/396927/
>
>  - [v4,7/9] package/opencv: fix opencv.pc file generation
>    http://patchwork.ozlabs.org/patch/396929/
>
>  - [v4,8/9] package/vlc: add opencv support
>    http://patchwork.ozlabs.org/patch/396930/
>
>  - [v4,9/9] package/gstreamer1/gst1-plugins-bad: rework opencv plugin dependencies
>    http://patchwork.ozlabs.org/patch/396931/

For this opencv serie, last time I rebased it (around the last BR dev
days back in February), it still cleanly applied with no conflict but
i don't remember the build test result.
This series mostly miss review and/or feedback.
Anyway, I'll rebase it, retest it and repost it for the next merge window.

>
>  - [1/2] target-finalize: generate all *.pyc
>    http://patchwork.ozlabs.org/patch/448095/
>
>  - [2/2] package/samba4: remove SAMBA4_BUILD_PYC_FILES hook
>    http://patchwork.ozlabs.org/patch/448096/

Polishing still in progress.
Again, for the 2015.08 cycle.

>
> We have a lot of pending patches:
>    https://patchwork.ozlabs.org/project/buildroot/list/
>
> You can help shorten this list by reviewing and testing patches, which
> helps the maintainers when applying patches. The more patches are
> reviewed or tested patches, the more are applied; the more are
> applied, the shorter the list; the shorter the list, the faster
> patches are applied.
>
> Thanks a lot for your help and contribution to Buildroot!
> --
> Buildroot, http://buildroot.org

Regards,

-- 
Samuel
