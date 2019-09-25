From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 18:04:00 +0200
Subject: [Buildroot] [PATCH v5] package/nfs-utils: enable IPv6
In-Reply-To: <20190911203344.7839-1-unixmania@gmail.com> (unixmania's message
 of "Wed, 11 Sep 2019 17:33:44 -0300")
References: <20190911203344.7839-1-unixmania@gmail.com>
Message-ID: <87a7asmkgf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > IPv6 requires libtirpc, so select BR2_PACKAGE_LIBTIRPC unconditionally.

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=10806

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>
 > ---
 > CC: nathan.renniewaldock at gmail.com
 > CC: Peter Seiderer <ps.report@gmx.net>
 > CC: Arnout Vandecappelle <arnout@mind.be>
 > CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > --
 > Changes v1->v2
 > - Select LIBTIRPC unconditionally.
 > Changes v2->v3
 > - Do not select libtirpc inconditionally
 > Changes v3->v4
 > - Restore v1 commit message
 > - Add comment about selecting libtirpc to Config.in
 > Changes v4->v5
 > - Select LIBTIRPC unconditionally, again (back to v2)

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
