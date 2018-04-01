From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 22:21:45 +0200
Subject: [Buildroot] [PATCH v2 4/5] support/scripts/graph-depends: add
 --flat-list option
In-Reply-To: <20180331163543.6278-5-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 31 Mar 2018 18:35:42 +0200")
References: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
 <20180331163543.6278-5-thomas.petazzoni@bootlin.com>
Message-ID: <87sh8eptie.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > From: George Redivo <george.redivo@datacom.ind.br>
 > graph-depends currently spits out a graph in .dot format. However, as
 > part of the upcoming introduction of <pkg>-show-recursive-depends and
 > <pkg>-show-recursive-rdepends, we need graph-depends to be able to
 > display a flat list.

 > Signed-off-by: George Redivo <george.redivo@datacom.ind.br>
 > [Thomas:
 >  - Rebase on top of graph-depends changes
 >  - Do not display the package name itself in the list, only its
 >    dependencies (or reverse dependencies)
 >  - Display the result on a single line, instead of one package per
 >    line, in order to match what <pkg>-show-depends and
 >    <pkg>-show-rdepends are doing today.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
