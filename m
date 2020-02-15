From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 12:02:01 +0100
Subject: [Buildroot] [PATCH] package/screen: bump version to 4.8.0
In-Reply-To: <20200214072701.26574-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 14 Feb 2020 08:27:01 +0100")
References: <20200214072701.26574-1-peter@korsgaard.com>
Message-ID: <87r1ywjeqe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes a memory corruption issue in OSC 49 handling.  Notice that this is
 > only enabled if screen is built with --enable-rxvt_osc, which isn't the case
 > in Buildroot. From the release notes:

 > As last fix, fixes potential memory overwrite of quite big size (~768
 > bytes), and even though I'm not sure about potential exploitability of
 > that issue, I highly recommend everyone to upgrade as soon as possible.
 > This issue is present at least since v.4.2.0 (haven't checked earlier).

 > https://lists.gnu.org/archive/html/screen-devel/2020-02/msg00007.html

 > Upstream changed the gnu.org URLs to use HTTPS, so adjust
 > 0005-rename-sched_h.patch to match.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
