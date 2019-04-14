From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:15:16 +0200
Subject: [Buildroot] [PATCH 0/7] Bump docker packages to v18.09.4
In-Reply-To: <20190401182352.26342-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 1 Apr 2019 20:23:44 +0200")
References: <20190401182352.26342-1-peter@korsgaard.com>
Message-ID: <87pnpogufv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Bump the docker packages to the v18.09.4 release.
 > Unit test is still successful:
 > ./support/testing/run-tests -o output-test tests.package.test_docker_compose
 > 19:38:21 TestDockerCompose                        Starting
 > 19:38:23 TestDockerCompose                        Building
 > 20:14:18 TestDockerCompose                        Building done
 > 20:15:03 TestDockerCompose                        Cleaning up
 > .
 > Ran 1 test in 2211.902s

 > OK

 > Peter Korsgaard (7):
 >   package/runc: bump to version 1.0.0-rc7
 >   Revert "package/runc: blacklist Codesourcery ARM toolchain"
 >   Revert "runc: depend on linux headers >= 3.11 for O_TMPFILE"
 >   package/docker-containerd: bump version to v1.2.5
 >   package/docker-containerd: refer to official website
 >   package/docker-engine: bump to version v18.09.4
 >   package/docker-cli: bump to version v18.09.4

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
