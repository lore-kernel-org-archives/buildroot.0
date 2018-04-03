From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 17:01:30 +0200
Subject: [Buildroot] [PATCH] libnss: add upstream patch fixing build on
 aarch64
In-Reply-To: <20180403121339.31699-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 3 Apr 2018 14:13:39 +0200")
References: <20180403121339.31699-1-peter@korsgaard.com>
Message-ID: <87o9j0pc51.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/037/037c772a36762df8febd529b329743d18ffbf66a/

 > Build system forgets to compile a file on aarch64, breaking the build.

 > For details, see the upstream bugreport:
 > https://bugzilla.mozilla.org/show_bug.cgi?id=1432455

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
