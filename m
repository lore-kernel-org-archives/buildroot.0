From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 09:01:38 +0100
Subject: [Buildroot] [PATCH] btrfs-progs: fix static build
In-Reply-To: <2de1279dcd485fe0a9dda147272221766bb7e187.1417159092.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 28 Nov 2014 09:18:12 +0200")
References: <2de1279dcd485fe0a9dda147272221766bb7e187.1417159092.git.baruch@tkos.co.il>
Message-ID: <87egsnn47x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > libuuid needs -lintl when BR2_NEEDS_GETTEXT_IF_LOCALE is set.
 > Fixes:
 > http://autobuild.buildroot.net/results/9f1/9f182cd5955d724750135bcd6cb7e315fb28334f/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
