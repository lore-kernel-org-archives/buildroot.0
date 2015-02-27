From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 09:25:21 +0100
Subject: [Buildroot] [PATCH v2] libgc: Remove duplicated package
In-Reply-To: <9a4b9405c3a2ce2970aa201ad9cc3d4ea9dc9e99.1425011887.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 27 Feb 2015 06:38:07 +0200")
References: <9a4b9405c3a2ce2970aa201ad9cc3d4ea9dc9e99.1425011887.git.baruch@tkos.co.il>
Message-ID: <87sidr3gni.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > From: Pedro Aguilar <paguilar@paguilar.org>
 > Remove libgc that is a copy of bdwgc but it's not used
 > by any package and gives an error when building make-4.1.
 > bdwgc is a mandatory dependency for guile.

 > Fixes:
 > http://autobuild.buildroot.net/results/b80a34a602b1241bc03cd43df1a269389d50e75c/

 > Reported-by: Baruch Siach <baruch@tkos.co.il>
 > Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
 > [baruch: added Reported-by, Config.in.legacy entry, autobuilder reference]
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
