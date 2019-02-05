From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 18:09:34 +0100
Subject: [Buildroot] [PATCH] package/ipmitool: add openssl 1.1.x
 compatibility
In-Reply-To: <1549377429-14698-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 5 Feb 2019 08:37:09 -0600")
References: <1549377429-14698-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87va1ykvqp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Changes adapt the current codebase to use support APIs now that
 > openssl 1.1.x by default disables all depricated items.

 > Fixes
 > http://autobuild.buildroot.net/results/97d/97dab568f1f3d342b6bfcb9f597ced4de6f1309e

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
