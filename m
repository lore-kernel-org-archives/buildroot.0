From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Mar 2019 11:09:56 +0100
Subject: [Buildroot] [PATCH-for-master] Revert "testing/tests/download:
 test git special ref"
In-Reply-To: <20190226030209.19322-1-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Tue, 26 Feb 2019 00:02:09 -0300")
References: <20190226030209.19322-1-ricardo.martincoski@gmail.com>
Message-ID: <87y35yucqz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > This reverts commit 81771cfcdc40e5909a4ec663e7c88b3a32068c05.
 > The download of sha1 of a special ref currently works or not depending
 > on the git client version in use.
 > With git version 2.11.0 (present in the docker image) it does not work.
 > With git version 2.17.1 it works.

 > For the sake of reproducibility, remove this part of the TestGitRefs
 > test case until some code gets added to the download infra to handle
 > sha1 of a special ref for any git client version.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/158295269

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 > TestGitRefs after this patch:
 > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/167428144

Committed, thanks.

-- 
Bye, Peter Korsgaard
