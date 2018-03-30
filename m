From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:31:52 +0200
Subject: [Buildroot] [git commit] uboot: fix build for older uboot
 source trees
In-Reply-To: <20180312225038.E70DE8346A@busybox.osuosl.org> (Peter Korsgaard's
 message of "Mon, 12 Mar 2018 23:50:17 +0100")
References: <20180312225038.E70DE8346A@busybox.osuosl.org>
Message-ID: <87lge9w8qf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f437bf547ca44849db4578c31707afdd96b85018
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The change in commit bf733342324b414a1142b57781504111f81c97ea only works
 > for newer uboot source trees. Add a check that scripts/dtc/libfdt
 > directory exists before making this change.

 > [Peter: add comment explaining why]
 > Signed-off-by: Stefan Becker <chemobejk@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
