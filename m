From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 23:48:41 +0200
Subject: [Buildroot] [git commit] acl: build fix with GCC 4.4.7
In-Reply-To: <20180731194419.BBAEA8A69E@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 31 Jul 2018 21:50:03 +0200")
References: <20180731194419.BBAEA8A69E@busybox.osuosl.org>
Message-ID: <878t4wrbye.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=a957cdfbb69d094cf17909eee64cd11dafdc84ab
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The acl source code uses pragmas inside functions, which is not
 > supported by gcc 4.4, still in use in older distributions. This commit
 > adds a patch that drops such pragma. Indeed, this acl is not built
 > with -Werror, the warning removals are not that important.

 > Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
