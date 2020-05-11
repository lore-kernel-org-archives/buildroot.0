From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2020 17:47:55 +0200
Subject: [Buildroot] [PATCH] packager/docker-cli: bump version to 19.03.7
In-Reply-To: <20200511095318.13251-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 11 May 2020 11:53:18 +0200")
References: <20200511095318.13251-1-peter@korsgaard.com>
Message-ID: <877dxipj6c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > To match the docker-engine version.
 > ./support/testing/run-tests tests.package.test_docker_compose.TestDockerCompose
 > 09:54:39 TestDockerCompose                        Starting
 > 09:54:40 TestDockerCompose                        Building
 > 10:45:33 TestDockerCompose                        Building done
 > 10:46:30 TestDockerCompose                        Cleaning up
 > .
 > ----------------------------------------------------------------------
 > Ran 1 test in 3121.828s

 > OK

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
