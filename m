From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 22:53:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: fix compilation error
 for kernels >= 4.15
In-Reply-To: <1517346369-1364-1-git-send-email-martin@barkynet.com> (Martin
 Bark's message of "Tue, 30 Jan 2018 21:06:09 +0000")
References: <1517346369-1364-1-git-send-email-martin@barkynet.com>
Message-ID: <87607jau8p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > Include the upstream fix 0001-tethering-Reorder-header-includes.patch
 > Fixes
 > http://autobuild.buildroot.net/results/90005b436e25495a1113966112785278dfc0420a
 > http://autobuild.buildroot.net/results/ab713048093746576734e90290b8777222d70e7e
 > http://autobuild.buildroot.net/results/368c2c8ab9b8db7f445a9681082ce1e10c7e0151
 > http://autobuild.buildroot.net/results/1c98fd9ce430463e720212ce8a3698e2b72cbe7d
 > http://autobuild.buildroot.net/results/bc865093e6ffec4737433c5a213c0241495e9ccc
 > http://autobuild.buildroot.net/results/e4d93b136ef8aff600264d743191bf087044c27a
 > http://autobuild.buildroot.net/results/a2feeeed4d0d11fda5f029f8c784ed6ce16ee856

 > Signed-off-by: Martin Bark <martin@barkynet.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
