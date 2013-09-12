From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 11 Sep 2013 21:57:21 -0500
Subject: [Buildroot] [PATCH v2 3/7] mesa3d: pull out from x11
In-Reply-To: <20130908190231.70e667fa@skate>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
 <1378441521-10050-4-git-send-email-spenser@gillilanding.com>
 <20130908190231.70e667fa@skate>
Message-ID: <CAEBucnB6NJGS=5WoiwieasauipypqSX5phq-Xp_GGSiALM3dnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> In your patch 4/7, mesa3d still has a 'depends on BR2_PACKAGE_XORG7',
> so to me, it makes little sense to move it out of the package/x11r7/
> directory.
>
> I believe we first need to make the libdrm package selectable without
> BR2_PACKAGE_XORG7 (which as explained in my review of patch 1/7,
> requires moving the pthread-stubs package outside of the
> BR2_PACKAGE_XORG7 condition), then we can make mesa3d selectable
> without BR2_PACKAGE_XORG7.
>
> Bottom-line: I believe it's too early to move mesa3d outside of
> package/x11r7/. Let's keep it in there for now, merge your current
> patches, and work on that as a followup step.
>

I'll add the move of pthread stubs (and any other required X libs) to
this patch set.

Thanks,
Spenser

-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
