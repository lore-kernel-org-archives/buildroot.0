From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2015 00:11:56 +0200
Subject: [Buildroot] [PATCH] qemu: fix build on sh4a and sh4aeb
In-Reply-To: <1431377621-2446-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 May 2015 22:53:41 +0200")
References: <1431377621-2446-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87h9riix1v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Qemu doesn't understand sh4a and sh4aeb as separate architectures, it
 > only knows about sh4 and sh4eb. However, it does support sh4a, since
 > it emulates the SH7785 CPU which is a SH4A.

 > Therefore, with this commit, sh4a/sh4aeb are translated as sh4/sh4eb
 > for Qemu.

 > Fixes:

 >   http://autobuild.buildroot.org/results/8f9/8f99a776f35d4ab0841d9fd2db509850ef603bd4/
 >   and many previous similar build failures

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
