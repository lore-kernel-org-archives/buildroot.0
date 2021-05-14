From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 May 2021 23:00:44 +0200
Subject: [Buildroot] [PATCH 3/3] test_docker_compose.py: Test the volume
 mount feature
In-Reply-To: <20210513210353.11335-3-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 13 May 2021 23:03:53 +0200")
References: <20210513210353.11335-1-peter@korsgaard.com>
 <20210513210353.11335-3-peter@korsgaard.com>
Message-ID: <87v97lowsj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Extend docker_compose_test() to expose /bin on the host to the container
 > through a volume mount and verify that /bin/busybox can be downloaded and
 > contains the right data.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
