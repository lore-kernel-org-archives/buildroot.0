From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Dec 2018 08:44:42 +0100
Subject: [Buildroot] [git commit] package/dt-utils: fix build with glibc
 2.28
In-Reply-To: <20181203123532.CBF1B8A497@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 3 Dec 2018 13:38:00 +0100")
References: <20181203123532.CBF1B8A497@busybox.osuosl.org>
Message-ID: <87in00tslx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7e5094033df2efc88928071c6e7a2867c396ca68
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This commit backports an upstream patch that fixes the build of
 > dt-utils with glibc 2.28+.

 > Fixes bug #11536.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
