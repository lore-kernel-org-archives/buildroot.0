From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Dec 2012 21:50:53 +0100
Subject: [Buildroot] [PATCH 1/8] ccache: uses fork(),
	there only usable on MMU platforms
In-Reply-To: <af11bb3bb397ca7a580f200d117fa68953811297.1355076808.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Dec 2012 19:13:56 +0100")
References: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
 <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
 <af11bb3bb397ca7a580f200d117fa68953811297.1355076808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ip8bvtjm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Fixes:
 Thomas>   http://autobuild.buildroot.org/results/2ba0eb693d24ac4ed9979762db234bfff1952c69/build-end.log

Committed with commit message changed with s/there/therefore/, thanks.

-- 
Bye, Peter Korsgaard
