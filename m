From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:20:22 +0200
Subject: [Buildroot] [git commit] package/meson: make pkg-config
 --static aware
In-Reply-To: <20200412185803.38F848E7BE@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 12 Apr 2020 21:03:57 +0200")
References: <20200412185803.38F848E7BE@busybox.osuosl.org>
Message-ID: <87368l6u7t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=cf75d7da98596580eee5a9b5e1a3e156ad832099
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Our pkg-config wrapper is not used since commit
 > 4e0bc29993376613d200e892d491e31ea5a49622, this raise static build
 > failures with libglib2 because --static is not passed anymore to
 > pkg-config so add a patch to get back the old behaviour.

 > The patch was proposed upstream
 > https://github.com/mesonbuild/meson/pull/6629, and the feedback was
 > not very positive. However, we need a solution that works for
 > Buildroot now, and this proposal is simple enough.

 > Fixes:

 >   http://autobuild.buildroot.org/results/0d36952def63cb69628697fa6408aeb6ce10cb5b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
