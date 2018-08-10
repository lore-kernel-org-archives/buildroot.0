From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Aug 2018 08:32:28 +0200
Subject: [Buildroot] [2018.02.x 2/2] support/testing: add test for file
 capabilities
In-Reply-To: <20180806031715.7088-2-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Mon, 6 Aug 2018 00:17:15 -0300")
References: <20180806031715.7088-1-ricardo.martincoski@gmail.com>
 <20180806031715.7088-2-ricardo.martincoski@gmail.com>
Message-ID: <87va8ienpf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > ---
 > complete run on GitLab CI on top of 2018.02.4 with the series applied:
 > https://gitlab.com/RicardoMartincoski/buildroot/pipelines/27226377

 > only the test on top of 2018.02.4:
 > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/86985431

 > only the test on top of 2018.05.1:
 > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/86985455

 > only the test on top of 2018.08-rc1:
 > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/86985484

I know it fails on master, but then we are atleast aware of it, so:

Committed to master, and then backported to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
