From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 21:21:29 +0200
Subject: [Buildroot] [PATCH] package/opentyrian: switch ot using github
In-Reply-To: <87y2chqhty.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 14 May 2021 20:40:57 +0200")
References: <20210429195324.2463255-1-yann.morin.1998@free.fr>
 <87y2chqhty.fsf@dell.be.48ers.dk>
Message-ID: <874kf1np3a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> OpenTyrian was previously managed in a Mercurial repository hosted on
 >> Bitbucket. Mid-2020, Bitbucket shut off all its Mercurial repositories:
 >> https://bitbucket.org/blog/sunsetting-mercurial-support-in-bitbucket

 >> Since then, OpenTyrian's source code is inacessible, but we have had no
 >> build failure associated as there is an old archive hosted on s.b.o, so
 >> that all builds fallback to downloading that:
 >> http://sources.buildroot.net/opentyrian/opentyrian-9c9f0ec3532b.tar.gz

 >> However, the project has been revived (kinda) on github:
 >> https://github.com/opentyrian/opentyrian

 >> Git commit cf5dbeb69eebd9ef9afc4473088d9469b79589eb has been found to
 >> be the closest, both in content and date, to the Mercuail reference
 >> 9c9f0ec3532b we were using. The only deltas are in Mercurial-specific
 >> files:

 >> b/.hg_archival.txt |    5     0     5     0 -----
 >> b/.hgtags          |    2     1     1     0 +-
 >> 2 files changed, 1 insertion(+), 6 deletions(-)

 >> While at it, add a hash file.

 >> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 >> Cc: Julien Boibessot <julien.boibessot@armadeus.com>

 > Committed, thanks.

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
