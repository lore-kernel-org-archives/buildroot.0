From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 May 2019 23:06:24 +0200
Subject: [Buildroot] [PATCH 1/2 v3] support/scripts: use show-info to
 extract dependency graph
In-Reply-To: <83e280d556b75984c34a3ce2de261e5c123b1a1a.1557262335.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 7 May 2019 22:52:28 +0200")
References: <cover.1557262335.git.yann.morin.1998@free.fr>
 <83e280d556b75984c34a3ce2de261e5c123b1a1a.1557262335.git.yann.morin.1998@free.fr>
Message-ID: <87mujykm9b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, we extract the dependency graph from the aptly named but
 > ad-hoc show-dependency-graph rule.

 > We now have a better solution to report package information, with
 > show-info.

 > Since show-dependency-graph never went into a release so far, and
 > show-info does provide the same (and more), switch to using show-info.

 > Thanks to Adam for suggesting the coding style to have a readable code
 > that is not ugly but still pleases flake8. Thanks to Arnout for
 > suggesting the use of dict.get() to further simplify the code.

 > Note: we do not use the reverse_dependencies field because it only
 > contains those packages that have a kconfig option, so we'd miss most
 > host packages.

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
 > Cc: Adam Duskett <aduskett@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
