From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 13:21:37 +0200
Subject: [Buildroot] [PATCH] xorriso: fix musl build
In-Reply-To: <851221e66c460e766b01cb962c4a2f0c39863284.1464088400.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 24 May 2016 14:13:20 +0300")
References: <851221e66c460e766b01cb962c4a2f0c39863284.1464088400.git.baruch@tkos.co.il>
Message-ID: <87d1obd7lq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a patch that adds the missing header for ssize_t.
 > Fixes:
 > http://autobuild.buildroot.net/results/820/82014874f5b97de8504d8409b286889b582a7454/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
