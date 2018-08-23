From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 21:13:51 +0200
Subject: [Buildroot] [PATCH] cryptsetup: fix build with pre C11
 toolchains
In-Reply-To: <efe392e11d8deb9334a1b567a010b9dae466143b.1534335249.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 15 Aug 2018 15:14:09 +0300")
References: <efe392e11d8deb9334a1b567a010b9dae466143b.1534335249.git.baruch@tkos.co.il>
Message-ID: <87o9ds521c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a patch removing a redefined typedef. Redefinition of typedef, even
 > to the same type, used to be illegal before C11.

 > Fixes:
 > http://autobuild.buildroot.net/results/93b/93b300a62f2ddbad66eab08e25fc3225969f224b/
 > http://autobuild.buildroot.net/results/6c6/6c6092d633400498ee5b8090733a949a9632e473/
 > http://autobuild.buildroot.net/results/f46/f46ef6123b5fa92753ff534b4ef7bea3f53ac388/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
