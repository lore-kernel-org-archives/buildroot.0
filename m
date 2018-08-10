From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Aug 2018 10:37:21 +0200
Subject: [Buildroot] [PATCH 2018.02.x 1/1] qt5xmlpatterns: fix license
 files for 5.9.x variant
In-Reply-To: <20180801082938.1726-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Wed, 1 Aug 2018
 10:29:38 +0200")
References: <20180801082938.1726-1-sebastien.szymanski@armadeus.com>
Message-ID: <87in4iehxa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?bastien" == S?bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

 > Similar to commit 3c6958423f6f (qt5: bump latest version to 5.10.1), the
 > 5.9.x (and 5.8.x) versions of qt5xmlpatterns doesn't have the 'v' in the
 > license file names, as slightly different formatting/content, so adjust the
 > _LICENSE_FILES and hashes to match.

 > Fixes:
 >  http://autobuild.buildroot.net/results/8a9e40a8c56f2bf1cbf2d2dcab4a874a3fefa367

 > Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
 > ---
 >  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash | 2 ++
 >  package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 1 deletion(-)

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
