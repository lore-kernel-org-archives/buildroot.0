From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Jul 2020 09:13:34 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: drop explicit docker
 kernel options from docker test
In-Reply-To: <20200727222158.25910-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 28 Jul 2020 00:21:58 +0200")
References: <20200727222158.25910-1-peter@korsgaard.com>
 <20200727222158.25910-2-peter@korsgaard.com>
Message-ID: <87zh7g9mxt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Since commit 0390777bfaff6c6 (package/docker-engine: needs some kernel
 > options), docker-engine now automatically ensures the needed kernel options
 > are enabled, so drop the explicit options from the kernel config.

 > 23:19:27 TestDockerCompose                        Starting
 > 23:19:28 TestDockerCompose                        Building
 > 00:14:41 TestDockerCompose                        Building done
 > 00:15:30 TestDockerCompose                        Cleaning up
 > .
 > ----------------------------------------------------------------------
 > Ran 1 test in 3362.784s

 > OK

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
