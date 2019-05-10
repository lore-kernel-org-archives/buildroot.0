From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 May 2019 12:17:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/docker-cli: bump version to
 18.09.6
In-Reply-To: <20190506191903.6703-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 6 May 2019 21:19:02 +0200")
References: <20190506191903.6703-1-peter@korsgaard.com>
 <20190506191903.6703-2-peter@korsgaard.com>
Message-ID: <87a7fur4uu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Additional post-18.09.5 fixes:
 > Builder:
 > - Fixed COPY and ADD with multiple <src> to not invalidate cache if
 >   DOCKER_BUILDKIT=1.moby/moby#38964

 > Networking:
 > - Cleaned up the cluster provider when the agent is closed. docker/libnetwork#2354
 > - Windows: Now selects a random host port if the user does not specify a
 >   host port.  docker/libnetwork#2369
 > - --service-cluster-ip-range is now configurable for UCP install.
 >   docker/orca#10263

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
