From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 20:58:42 +0100
Subject: [Buildroot] [PATCH] libpjsip: fix musl build
In-Reply-To: <1457993882-30212-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Mon, 14 Mar 2016 23:18:02 +0100")
References: <1457993882-30212-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87mvpza4y5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Fix two different build issues when building against musl.
 > Fixes:
 >   http://autobuild.buildroot.net/results/e5c/e5c85272b5561549dfc478264ee6507bb9ad8c9f/

 > Based on an Alpine Linux patch [0] as suggested by Thomas [1].

 > [0] http://git.alpinelinux.org/cgit/aports/plain/main/pjproject/musl-fixes.patch
 > [1] http://lists.busybox.net/pipermail/buildroot/2016-March/155056.html

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
