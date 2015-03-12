From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Mar 2015 23:41:54 +0100
Subject: [Buildroot] [PATCH v3] qt: fix postgresql plugin compile
In-Reply-To: <1426109011-14124-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Wed, 11 Mar 2015 22:23:31 +0100")
References: <1426109011-14124-1-git-send-email-ps.report@gmx.net>
Message-ID: <87fv99j0st.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add qt4 '-psql_config' configure option and use it to set
 > pg_config path in configure step instead of legacy PSQL_LIBS
 > enviornment variable.

 > Fixes [1]:

 > PostgreSQL support cannot be enabled due to functionality tests!
 >  Turn on verbose messaging (-v) to ./configure to see the final report.
 >  If you believe this message is in error you may use the continue
 >  switch (-continue) to ./configure to continue.
 > make: *** [/ssd1/thomas/autobuild/instance-0/output/build/qt-4.8.6/.stamp_configured] Error 101

 > Patch suggested upstream ([2]).

 > [1] http://autobuild.buildroot.net/results/1e9/1e949d4593836bc45a55e071cc54ff9c00fad8ae
 > [2] https://codereview.qt-project.org/108345

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
