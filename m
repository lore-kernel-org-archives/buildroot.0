From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 22:21:52 +0200
Subject: [Buildroot] [PATCH v2 5/5] package/pkg-generic: add
 <pkg>-show-recursive-(r)depends targets
In-Reply-To: <20180331163543.6278-6-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 31 Mar 2018 18:35:43 +0200")
References: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
 <20180331163543.6278-6-thomas.petazzoni@bootlin.com>
Message-ID: <87o9j2pti7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > From: George Redivo <george.redivo@datacom.ind.br>
 > This commit adds the support for <pkg>-show-recursive-depends and
 > <pkg>-show-recursive-rdepends which respectively show the list of all
 > dependencies or reverse dependencies for a given package. The existing
 > show-depends and show-rdepends only show the first-level dependencies,
 > while show-recursive-depends and show-recursive-rdepends show
 > recursively the dependencies.

 > It is worth mentioning that while show-recursive-depends really shows
 > all dependencies, show-recursive-rdepends is a bit limited because the
 > reverse dependencies of host packages are not properly accounted
 > for. But that's a limitation that already exists in show-rdepends, and
 > that cannot easily be solved.

 > Signed-off-by: George Redivo <george.redivo@datacom.ind.br>
 > [Thomas:
 >  - split from the patch that was also changing graph-depends
 >  - rename show-rrdepends to show-recursive-rdepends
 >  - add show-recursive-depends
 >  - don't create GRAPHS_DIR.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
