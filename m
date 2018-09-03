From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Sep 2018 09:23:10 +0200
Subject: [Buildroot] [PATCH] php: pdo mysql extension needs hash as well
In-Reply-To: <20180902075735.8010-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 2 Sep 2018 09:57:35 +0200")
References: <20180902075735.8010-1-peter@korsgaard.com>
Message-ID: <87wos32gf5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/69cf9326539c8df8fa50c5e7acb2ce3bb985ede2/

 > The PDO mysql extension also needs the hash extension - so select it,
 > similar to how it was done for the mysqli extension in commit 65f96452636
 > (php: fix build with mysqli).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
