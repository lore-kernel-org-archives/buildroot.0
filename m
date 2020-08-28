From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:38:11 +0200
Subject: [Buildroot] [PATCH] support/docker: drop Python 2.x modules
In-Reply-To: <20200814195820.987824-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 14 Aug 2020 21:58:20 +0200")
References: <20200814195820.987824-1-thomas.petazzoni@bootlin.com>
Message-ID: <87wo1isp3g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Since commit 4a40d36f131890941c1e482eb5f28ebcd81cb7a3
 > ("support/testing: switch to Python 3 only") our runtime testing
 > infrastructure is Python 3.x only.

 > Therefore, it is no longer needed to have python-nose2 and
 > python-pexpect in the Docker container used to run our Gitlab CI jobs.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
