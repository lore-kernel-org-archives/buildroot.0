From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:04:17 +0200
Subject: [Buildroot] [PATCH] vboot-utils: disable static futility
In-Reply-To: <20171003083737.GA3986@latitude.localdomain> (Alex Suykov's
 message of "Tue, 3 Oct 2017 11:37:37 +0300")
References: <20171003083737.GA3986@latitude.localdomain>
Message-ID: <87vajejgby.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alex" == Alex Suykov <alex.suykov@gmail.com> writes:

 > Possibly fixes
 > http://autobuild.buildroot.net/results/fbe/fbe7892539cc1bf18f89d18c6609a5aa747647d0/
 > http://autobuild.buildroot.net/results/4bc/4bc388618ff02dde26ae09db021434a936c8cc1b/
 > and similar errors.

 > Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
 > ---
 > Please note this is a blind fix. I cannot reproduce the build errors,
 > which all happen on the same build node, and I cannot verify that
 > the patch does in fact fix them. 

 > It's probably still a good idea to avoid unnecessary static linking
 > in a host package.

 >  .../vboot-utils/0004-Disable-static-futility.patch | 30 ++++++++++++++++++++++
 >  1 file changed, 30 insertions(+)
 >  create mode 100644 package/vboot-utils/0004-Disable-static-futility.patch

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
