From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 23:53:14 +0200
Subject: [Buildroot] [git commit] package/webkitgtk: remove upstreamed
 patch
In-Reply-To: <20190801144334.24F73813FB@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 1 Aug 2019 16:46:17 +0200")
References: <20190801144334.24F73813FB@busybox.osuosl.org>
Message-ID: <874l2b7bcl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d069301d6325075395a99bf041d7ea2a1410080c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The bump of webkitgtk to 2.24.3 in commit
 > 3ff05d9094be1329b5987589d6b6fefb152ff006 forgot to drop a patch that
 > was upstreamed, and is now part of 2.24.3, causing a build failure, so
 > let's drop this patch.

 > Fixes:

 >   http://autobuild.buildroot.net/results/4d7bffd20344f06ca719b7c8083b81053b255aa5/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
