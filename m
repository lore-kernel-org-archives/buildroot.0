From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 21:24:52 +0200
Subject: [Buildroot] [PATCH 2/3] test_docker_compose.py: Test the port
 publish feature
In-Reply-To: <20210513210353.11335-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 13 May 2021 23:03:52 +0200")
References: <20210513210353.11335-1-peter@korsgaard.com>
 <20210513210353.11335-2-peter@korsgaard.com>
Message-ID: <87eee5mad7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Extend docker_test() to expose a random (8888) port to verify that doesn't
 > fail, and extend the docker-compose test to run the busybox httpd in the
 > background, expose that as port 80 and verify that /etc/resolv.conf could be
 > fetched by wget.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
