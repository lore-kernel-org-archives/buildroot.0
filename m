From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Oct 2019 08:02:52 +0200
Subject: [Buildroot] [PATCH-2019.02.x] package/cups-filters: fix ln -r
 workaround for older patch versions
In-Reply-To: <20191004115537.31826-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 4 Oct 2019 13:55:37 +0200")
References: <20191004115537.31826-1-peter@korsgaard.com>
Message-ID: <87muef20hf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/d06/d06f908cbe80340312bdfe1b75cb577b68cd46d8/

 > 0001-install-support-old-ln-versions-without-the-r-option.patch adds a
 > ln-srf script for older distributions to emulate 'ln -r', but GNU patch <
 > 2.7 does not handle the git patch permission extensions - So ensure it is
 > executable.

 > https://savannah.gnu.org/forum/forum.php?forum_id=7361

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
