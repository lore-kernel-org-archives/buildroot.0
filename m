From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Apr 2021 09:55:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.105
In-Reply-To: <20210410001230.622d8998@gmx.net> (Peter Seiderer's message of
 "Sat, 10 Apr 2021 00:12:30 +0200")
References: <20210407144830.373018-1-bernd.kuhls@t-online.de>
 <87fszz6tzi.fsf@dell.be.48ers.dk> <20210410001230.622d8998@gmx.net>
Message-ID: <87y2dq60am.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Hello Peter, Bernd,
 > On Fri, 09 Apr 2021 23:14:25 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

 >> >>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
 >> 
 >> > Removed patch 0001, committed upstream:
 >> > https://cgit.freedesktop.org/mesa/drm/commit/?id=52f05d3d896480ee5431dcd444f53bb2a8e41cce
 >> 
 >> > Renumbered remaining patch.
 >> 
 >> > Updated license hash due to upstream commits:
 >> > https://cgit.freedesktop.org/mesa/drm/log/xf86drm.c
 >> 
 >> > Release notes:
 >> > https://lists.freedesktop.org/archives/dri-devel/2021-April/302515.html
 >> 
 >> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> 
 >> Committed, thanks.
 >> 
 >> > Is 0001-meson.build-enable-static-build.patch still needed?
 >> 
 >> Hmm, I don't know. Does the autobuild issue referenced in commit
 >> 54bcc1b188ab60a still trigger? Peter, you are the author of that commit?

 > I believe this question is a legacy/internal one/note, as the patch
 > is the same as the upstream commit mentioned above (but did not check in
 > detail)...., or Bernds note is about
 >   0002-tests-meson.build-disable-nouveau-tests-for-static-b.patch/
 >   0001-tests-meson.build-disable-nouveau-tests-for-static-b.patch
 > which would match with your mentioned commit 54bcc1b188ab60a?

Yes, indeed. The patch you added in commit 54bcc1b188ab60a.

 > Then the answer is: Do not know...., needs to be tested ;-)

Ok. Care to retry the failing autobuilder without the patch and send a
patch to remove the patch if no longer needed?

-- 
Bye, Peter Korsgaard
