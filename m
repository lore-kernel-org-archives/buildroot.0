From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Mar 2018 08:34:01 +0100
Subject: [Buildroot] [PATCH] tremor: security bump to fix CVE-2018-5146
In-Reply-To: <20180319214005.5872-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 19 Mar 2018 22:40:05 +0100")
References: <20180319214005.5872-1-peter@korsgaard.com>
Message-ID: <87y3injj4m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Prevent out-of-bounds write in codebook decoding.
 > Codebooks that are not an exact divisor of the partition size are now
 > truncated to fit within the partition.

 > Upstream has migrated from subversion to git, so change to git and bump the
 > version to include the fix for CVE-2018-5146.

 > While we're at it, also add a hash file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
