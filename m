From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 19:14:13 +0100
Subject: [Buildroot] [PATCH v2] package/luajit: drop static build
 handling
In-Reply-To: <790909caf28e2610e07b358113168deee7ff87c3.1605206085.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 12 Nov 2020 20:34:45 +0200")
References: <790909caf28e2610e07b358113168deee7ff87c3.1605206085.git.baruch@tkos.co.il>
Message-ID: <87k0upf7ka.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Static build of luajit is disabled since commit b2e8f28efac
 > ("package/luajit: disable for static build"). Remove the related
 > BUILDMODE handling as well.

 > Cc: Francois Perrad <francois.perrad@gadz.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: fix commit title

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
