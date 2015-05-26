From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 May 2015 23:59:06 +0200
Subject: [Buildroot] [PATCH] janus-gateway: disable for static build
In-Reply-To: <29110f591b47ab63c92023efdf9d419a7630a09b.1432636607.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 26 May 2015 13:36:47 +0300")
References: <29110f591b47ab63c92023efdf9d419a7630a09b.1432636607.git.baruch@tkos.co.il>
Message-ID: <87bnh7xaol.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > janus-gateway requires dlopen().
 > Fixes:
 > http://autobuild.buildroot.net/results/092/092aac2b8abe0edd868a7e0cc59cdaaf28ca4ad5/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
