From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Thu, 6 Jul 2017 10:00:39 +0800
Subject: [Buildroot] [PATCH] bwm-ng: update to latest upstream version
 to fix build issue
In-Reply-To: <20170705123836.50903eeb@windsurf>
References: <1499250824-26093-1-git-send-email-keguang.zhang@gmail.com>
 <20170705123836.50903eeb@windsurf>
Message-ID: <CAJhJPsUHg4Jr8jqQpharzZwZEwMpP8YTOD7hH9+Lv0Ju4XNNeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Since the upstream had fixed the error, we have no reason to keep a patch
inside package/bwm-ng/.

Moreover, the update contains not only th fix for build issue, but also a
improvement
https://github.com/vgropp/bwm-ng/commit/e9b980464e1fd72ae1b3d1002afb3b911daad619.patch
.

Therefore, I think updating version is better.

2017-07-05 18:38 GMT+08:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Wed,  5 Jul 2017 18:33:44 +0800, Kelvin Cheung wrote:
> > From: Keguang Zhang <keguang.zhang@spreadtrum.com>
> >
> > The latest upstream version had fixed the build issus.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/1d9/
> 1d9f0b62e4cc387f508b4fe0086621ab9996a085/
> >
> > Signed-off-by: Keguang Zhang <keguang.zhang@spreadtrum.com>
>
> Thanks. However, rather than bumping and having to autoreconf, I'm
> wondering if simply adding
> https://github.com/vgropp/bwm-ng/commit/d5daf15c2098040b8b01753d3cdce8
> c1c79fc528.patch
> inside package/bwm-ng/ isn't a simpler solution.
>
> Peter?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>



-- 
Best regards,

Kelvin Cheung
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170706/d2ff412a/attachment.html>
