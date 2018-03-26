From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Mar 2018 13:48:56 +0200
Subject: [Buildroot] [PATCH 1/1] brotli: disable unneeded check for C++
 compiler
In-Reply-To: <20180326113918.30054-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Mon, 26 Mar 2018 12:39:18 +0100")
References: <20180326113918.30054-1-aperez@igalia.com>
Message-ID: <87d0zrukev.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This adds a local patch, also submitted upstream, which modifies
 > CMakeLists.txt to avoid the check for the unneeded C++ compiler.

 > Fixes:
 > - http://autobuild.buildroot.net/results/68e05c634e62ba4b6f6eb8dc95eeb16faa58fd60

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
