From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 21:10:53 +0100
Subject: [Buildroot] [git commit] package/sudo: drop unneeded autoreconf
In-Reply-To: <20210127204009.C0DB4815BB@busybox.osuosl.org> (Peter Korsgaard's
 message of "Wed, 27 Jan 2021 21:59:31 +0100")
References: <20210127204009.C0DB4815BB@busybox.osuosl.org>
Message-ID: <87zh0szusy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=84a8aac451906c30f79c123afe4a415573021dc5
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 4fea71ac785cc (package/sudo: security bump to version 1.9.5p2)
 > removed the patch, but forgot to remove the now unneeded autoreconf.  Fix
 > that.

 > Reported-by: Baruch Siach <baruch@tkos.co.il>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
