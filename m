From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:17:30 +0100
Subject: [Buildroot] [PATCH 2/3] tslib: disable raw input plugin under
	kernel < v3.12
In-Reply-To: <4e6b08821af14328fceacf79bbdfa70f82deae8e.1484425049.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sat, 14 Jan 2017 22:17:28 +0200")
References: <9af1cba158ce6dcb96f5f121d4105895fea911b9.1484425049.git.baruch@tkos.co.il>
 <4e6b08821af14328fceacf79bbdfa70f82deae8e.1484425049.git.baruch@tkos.co.il>
Message-ID: <87wpdvdwrp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The SYN_CNT input code was added in kernel v3.12.
 > Fixes:
 > http://autobuild.buildroot.net/results/5cd/5cdb9d22092e9222cc7e8fe8dd3936305a5d371d/
 > http://autobuild.buildroot.net/results/211/2115038caff1e036cbc9dcb5cb6905abe643552a/
 > http://autobuild.buildroot.net/results/c79/c79de6fdd5cfe406979941790276296b6d1ec0b8/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
