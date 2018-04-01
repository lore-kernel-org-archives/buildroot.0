From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 22:21:16 +0200
Subject: [Buildroot] [PATCH 1/2] support/scripts/graph-depends: use the
 standard python logging module
In-Reply-To: <20180401191449.802-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 1 Apr 2018 21:14:48 +0200")
References: <20180401191449.802-1-peter@korsgaard.com>
Message-ID: <871sfyr83n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Instead of hardcoded sys.stderr.write() calls.  No functional change, but
 > allows us to easily implement a quiet option.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
