From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Mar 2018 10:50:36 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: fix build break in sdk target
In-Reply-To: <20180326072332.30808-1-chemobejk@gmail.com> (Stefan Becker's
 message of "Mon, 26 Mar 2018 10:23:32 +0300")
References: <20180326072332.30808-1-chemobejk@gmail.com>
Message-ID: <87lgefuso3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Becker <chemobejk@gmail.com> writes:

 > After commit 6729050f3a49dba42d2d881d31dbefd6b82b8dad nothing creates
 > $(HOST_DIR)/share/buildroot anymore, causing sdk to fail with:

 >  /bin/bash: .../output/host/share/buildroot/sdk-location: No such file or directory

 > Add creation of that directory to the "sdk" build steps itself.

 > Signed-off-by: Stefan Becker <chemobejk@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
