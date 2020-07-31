From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Jul 2020 09:13:28 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: drop explicit
 CGROUPFS_MOUNT from docker test
In-Reply-To: <20200727222158.25910-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 28 Jul 2020 00:21:57 +0200")
References: <20200727222158.25910-1-peter@korsgaard.com>
Message-ID: <874kpob1if.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Since commit 4f8229653 (package/docker-engine: needs more runtime
 > dependencies), docker-engine now automatically pulls in cgroupfs-mount, so
 > drop the explicit handling of it in TestDockerCompose.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
