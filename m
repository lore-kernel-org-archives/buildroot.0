From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 May 2014 23:51:51 +0200
Subject: [Buildroot] [PATCH] ipsec-tools: needs MMU support
In-Reply-To: <1400621560-27628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 20 May 2014 23:32:40 +0200")
References: <1400621560-27628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y4xwf79k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > ipsec-tools currently fails to build for Blackfin due to GLOB_TILDE
 > not being supported in Blackfin external toolchains. However, after
 > fixing this problem (which will be fixed in later versions of the
 > Blackfin external toolchains) allows to discover that ipsec-tools uses
 > fork() anyway.

 > Therefore, this patch simply marks ipsec-tools as not available on
 > non-MMU systems.

 > Consequently, it fixes:

 >   http://autobuild.buildroot.org/results/fc4/fc4ef4101a20e64eb52da56557d6996dd73b3d86/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
