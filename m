From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 20 Aug 2018 10:47:37 -0700
Subject: [Buildroot] How far did you get with Chromium v7 patch?
In-Reply-To: <CAD0+TpAhSOwRbdXOm-TAPvTuCsdu0QD3dSENP34RBMvpUDxH=Q@mail.gmail.com>
References: <CAD0+TpAhSOwRbdXOm-TAPvTuCsdu0QD3dSENP34RBMvpUDxH=Q@mail.gmail.com>
Message-ID: <CAMWSM7gPLDhasBzp5GfS2KDM2=LmhmNex3d-_NDro9GEONm5xA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fame,

On Wed, Aug 15, 2018 at 12:50 AM Fame Castle <famecastle@gmail.com> wrote:
>
> Hello Joseph,
>
> I was in vacation for a few weeks, so I was not able to contact you. I read that you did some work on chromium in the daily buildroot Digests. I wonder now, how far did you get with the chromium-v7 patch set? May I already use your v7 branch or does it yet contain errors?
>

I haven't submitted the v7 patchset upstream yet because it doesn't
reliably build on all of the architectures I'm targeting (i386,
x86_64, arm, and aarch64).

> If I can somehow help, please let me know!
>

My chromium-v7-wip branch can be found at
https://github.com/jakogut/buildroot. The package is currently
targeting version 68.0.3440.106, and the build is failing after a few
libstdc++ headers can't be found.

Here's a paste of that failure:
https://gist.github.com/jakogut/ac3dd7bb4ae99ec8f5c5877cb746a153

I haven't spent much time debugging this, but if you could try this
build on your platform and verify that it's not just an issue with my
setup, that would be helpful.

Thanks!
Joseph
