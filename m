From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 11:24:28 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: trim runtime tests for Ricardo
 Martincoski
In-Reply-To: <20190916020908.8099-1-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 15 Sep 2019 23:09:08 -0300")
References: <20190916020908.8099-1-ricardo.martincoski@gmail.com>
Message-ID: <87pnjn76lv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Keep listing the test infra so the developer is included in reviews, but
 > trim the list of tests to those the developer are most interested in.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > To me, it is really hard to write a commit log for DEVELOPERS file
 > without using the first person :-)
 > Please feel free to reword.

 > I tested the wildcard for the python tests using:
 > $ utils/get-developers -f <filename>
 > I assumed that if this works then the e-mail notifications for runtime
 > test failures will work too.
 > ---
 >  DEVELOPERS | 9 ++++++++-
 >  1 file changed, 8 insertions(+), 1 deletion(-)

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
