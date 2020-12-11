From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 22:28:40 +0100
Subject: [Buildroot] [PATCH] package/lynx: fix reproducible build issues
In-Reply-To: <20201129093514.25597-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 29 Nov 2020 10:35:13 +0100")
References: <20201129093514.25597-1-peter@korsgaard.com>
Message-ID: <87v9d8owvr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes (part of) http://autobuild.buildroot.net/results/23fe4365ca65f37eace8265a70fbfb9723b8ee9d/
 > Lynx by default contains logic to generate a "configuration info" HTML page,
 > which leaks build paths, and adds the build timestamp to the version output.
 > Disable both when building in reproducible mode.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
