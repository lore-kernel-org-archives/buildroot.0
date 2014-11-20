From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 16:03:47 +0100
Subject: [Buildroot] [PATCH] canfestival: disable static build
In-Reply-To: <f34a48cc344f0502ef923c31ad505a07c22a70bf.1416489676.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 20 Nov 2014 15:21:16 +0200")
References: <f34a48cc344f0502ef923c31ad505a07c22a70bf.1416489676.git.baruch@tkos.co.il>
Message-ID: <87lhn5gbho.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > canfestival doesn't really support static build. The configure script accepts
 > the --disable-dll parameter that should in theory allow a static build. In
 > practice this options is not well tested, as it causes the build to fails in
 > various places.

 > Fixes:
 > http://autobuild.buildroot.net/results/29f/29fd3e550937f48e2270149a3d44cfb8bcf5c16a/

 > Cc: Samuel Martin <s.martin49@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
