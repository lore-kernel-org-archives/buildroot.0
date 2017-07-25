From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 00:11:22 +0200
Subject: [Buildroot] [PATCH 1/3] efibootmgr: fix build with gcc 7.x
In-Reply-To: <20170711155957.10815-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 11 Jul 2017 17:59:55 +0200")
References: <20170711155957.10815-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87eft4xj3p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Now that the build of efivar with gcc 7.x has been fixed by commit
 > 0ca30170345a81f5f21e4ef4424b1f186cde1988 ("efivar: fix build with gcc
 > 7"), efibootmgr fails similarly with gcc 7.x.

 > This commit backports an upstream patch that fixes this issue.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
