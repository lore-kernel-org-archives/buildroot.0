From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 09:13:14 +0100
Subject: [Buildroot] [PATCH] package/dropbear: bump version to 2019.77
In-Reply-To: <20190323233441.21610-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 24 Mar 2019 00:34:41 +0100")
References: <20190323233441.21610-1-peter@korsgaard.com>
Message-ID: <87o960adwl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Drop patches as they are now upstream.  Add a hash for the license file.
 > Verified that runtime test still works:

 > ./support/testing/run-tests -o tests.package.test_dropbear
 > 20:42:44 TestDropbear                             Starting
 > 20:42:45 TestDropbear                             Building
 > 20:44:18 TestDropbear                             Building done
 > 20:44:24 TestDropbear                             Cleaning up
 > .
 > ----------------------------------------------------------------------
 > Ran 1 test in 100.727s

 > OK

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
