From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 May 2019 23:06:33 +0200
Subject: [Buildroot] [PATCH 2/2 v3] core: remove show-dependency-tree
In-Reply-To: <fc3002077beb3f48401c4280e5347f27f548b4a3.1557262335.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 7 May 2019 22:52:29 +0200")
References: <cover.1557262335.git.yann.morin.1998@free.fr>
 <fc3002077beb3f48401c4280e5347f27f548b4a3.1557262335.git.yann.morin.1998@free.fr>
Message-ID: <87imumkm92.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > show-dependency-tree was introduced in this release cycle, as a way to
 > quickly and easily provide the dependency tree to graph-depends.

 > show-dependency-tree is no longer used, now that graph-depends has been
 > switched over to using the more versatile show-info.

 > Beside, show-dependency-tree has never been part of a release.

 > Drop it.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
