From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2020 22:17:57 +0200
Subject: [Buildroot] [PATCH] package/gnupg: fix build with gcc 10
In-Reply-To: <20200526212754.112805-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 26 May 2020 23:27:54 +0200")
References: <20200526212754.112805-1-thomas.petazzoni@bootlin.com>
Message-ID: <87sgfefslm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit backports an upstream patch made for gnupg2 into gnupg, in
 > order to fix build failures with gcc 10 due to the use of
 > -fno-common. Due to the code differences between upstream gnupg2 and
 > the old gnupg 1.x, the backport is in fact more a rewrite than an
 > actual backport.

 > Fixes:

 >   http://autobuild.buildroot.net/results/496a18833505dc589f7ae58f2c7e5fe80fe9af79/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
