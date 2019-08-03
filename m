From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 14:52:40 +0200
Subject: [Buildroot] [PATCH 3/4] support/testing: test python-* with
 builtin kernel
In-Reply-To: <20190803052216.22292-4-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sat, 3 Aug 2019 02:22:15 -0300")
References: <20190803052216.22292-1-ricardo.martincoski@gmail.com>
 <20190803052216.22292-4-ricardo.martincoski@gmail.com>
Message-ID: <87r262csx3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Use the new builtin kernel 4.19 with VirtIORNG to provide entropy to
 > test all python packages by default.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/264508536
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/264508537
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/264508542
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/264508543

 > The workaround of adding haveged to the image is not needed anymore, so
 > remove it from the python-crossbar and python-nacl test.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reworded somewhat now that we are still using "builtin" for the new
kernel and committed, thanks.

-- 
Bye, Peter Korsgaard
